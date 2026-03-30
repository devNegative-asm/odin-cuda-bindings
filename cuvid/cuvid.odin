package cuvid
import "../cuda"
import "core:c"
/***********************************************************************************************************/
//! VIDEO_DECODER
//!
//! In order to minimize decode latencies, there should be always at least 2 pictures in the decode
//! queue at any time, in order to make sure that all decode engines are always busy.
//!
//! Overall data flow:
//!  - cuvidGetDecoderCaps(...)
//!  - cuvidCreateDecoder(...)
//!  - For each picture:
//!    + cuvidDecodePicture(N)
//!    + cuvidMapVideoFrame(N-4)
//!    + do some processing in cuda
//!    + cuvidUnmapVideoFrame(N-4)
//!    + cuvidDecodePicture(N+1)
//!    + cuvidMapVideoFrame(N-3)
//!    + ...
//!  - cuvidDestroyDecoder(...)
//!
//! NOTE:
//! - When the cuda context is created from a D3D device, the D3D device must also be created
//!   with the D3DCREATE_MULTITHREADED flag.
//! - There is a limit to how many pictures can be mapped simultaneously (ulNumOutputSurfaces)
//! - cuvidDecodePicture may block the calling thread if there are too many pictures pending
//!   in the decode queue */
cudaVideoCodec :: enum(c.int) {
    /**<  MPEG1             */
    MPEG1=0,
    /**<  MPEG2             */
    MPEG2,
    /**<  MPEG4             */
    MPEG4,
    /**<  VC1               */
    VC1,
    /**<  H264              */
    H264,
    /**<  JPEG              */
    JPEG,
    /**<  H264-SVC          */
    H264_SVC,
    /**<  H264-MVC          */
    H264_MVC,
    /**<  HEVC              */
    HEVC,
    /**<  VP8               */
    VP8,
    /**<  VP9               */
    VP9,
    /**<  AV1               */
    AV1,
    /**<  Max codecs        */
    NumCodecs,
    // Uncompressed YUV
    /**< Y,U,V (4:2:0)      */
    YUV420 = (('I'<<24)|('Y'<<16)|('U'<<8)|('V')),
    /**< Y,V,U (4:2:0)      */
    YV12   = (('Y'<<24)|('V'<<16)|('1'<<8)|('2')),
    /**< Y,UV  (4:2:0)      */
    NV12   = (('N'<<24)|('V'<<16)|('1'<<8)|('2')),
    /**< YUYV/YUY2 (4:2:2)  */
    YUYV   = (('Y'<<24)|('U'<<16)|('Y'<<8)|('V')),
    /**< UYVY (4:2:2)       */
    UYVY   = (('U'<<24)|('Y'<<16)|('V'<<8)|('Y'))
}
cudaVideoChromaFormat :: enum(c.int) {
    Monochrome=0,  /**< MonoChrome */
    YUV420,           /**< YUV 4:2:0  */
    YUV422,           /**< YUV 4:2:2  */
    YUV444            /**< YUV 4:4:4  */
}
cudaVideoSurfaceFormat :: enum(c.int) {
    /**< Semi-Planar YUV [Y plane followed by interleaved UV plane]     */
    NV12=0,
    /**< 16 bit Semi-Planar YUV [Y plane followed by interleaved UV plane]. Can be used for 10 bit(6LSB bits 0), 12 bit (4LSB bits 0)      */
    P016=1,
    /**< Planar YUV [Y plane followed by U and V planes]                */
    YUV444=2,
    /**< 16 bit Planar YUV [Y plane followed by U and V planes]. Can be used for 10 bit(6LSB bits 0), 12 bit (4LSB bits 0)      */
    YUV444_16Bit=3,
    /**< Semi-Planar YUV 422 [Y plane followed by interleaved UV plane] */
    NV16=4,
    /**< 16 bit Semi-Planar YUV 422[Y plane followed by interleaved UV plane]. Can be used for 10 bit(6LSB bits 0), 12 bit (4LSB bits 0)      */
    P216=5
}
cudaVideoDeinterlaceMode :: enum(c.int) {
    /**< Weave both fields (no deinterlacing) */
    Weave=0,
    /**< Drop one field                       */
    Bob,
    /**< Adaptive deinterlacing               */
    Adaptive
}

CUVIDDECODECAPS :: struct {
    /**< IN: cudaVideoCodec.XXX */
    eCodecType: cudaVideoCodec,
    /**< IN: cudaVideoChromaFormat.XXX */
    eChromaFormat: cudaVideoChromaFormat,
    /**< IN: The Value "BitDepth minus 8" */
    nBitDepthMinus8: c.uint,
    /**< Reserved for future use - set to zero */
    reserved1: [3]c.uint,
    /**< OUT: 1 if codec supported, 0 if not supported */
    bIsSupported: bool,
    /**< OUT: Number of NVDECs that can support IN params */
    nNumNVDECs: u8,
    /**< OUT: each bit represents corresponding cudaVideoSurfaceFormat enum */
    nOutputFormatMask: bit_set[cudaVideoSurfaceFormat; c.ushort],
    /**< OUT: Max supported coded width in pixels */
    nMaxWidth: c.uint,
    /**< OUT: Max supported coded height in pixels */
    nMaxHeight: c.uint,
    /**< OUT: Max supported macroblock count. CodedWidth*CodedHeight/256 must be <= nMaxMBCount */
    nMaxMBCount: c.uint,
    /**< OUT: Min supported coded width in pixels */
    nMinWidth: c.ushort,
    /**< OUT: Min supported coded height in pixels */
    nMinHeight: c.ushort,
    /**< OUT: 1 if Y component histogram output is supported, 0 if not. Note: histogram is computed on original picture data before any post-processing like scaling, cropping, etc. is applied */
    bIsHistogramSupported: u8,
    /**< OUT: histogram counter bit depth */
    nCounterBitDepth: u8,
    /**< OUT: Max number of histogram bins */
    nMaxHistogramBins: c.ushort,
    /**< Reserved for future use - set to zero */
    reserved3: [10]c.uint,
}

cudaVideoCreateFlags :: enum(c.int) {
    //Default     = 0x00,     /**< Default operation mode: use dedicated video engines                        */
    PreferCUDA,     /**< Use CUDA-based decoder (requires valid vidLock object for multi-threading) */
    PreferDXVA,     /**< Go through DXVA internally if possible (requires D3D9 interop)             */
    PreferCUVID      /**< Use dedicated video engines directly                                       */
} 

CUVIDDECODECREATEINFO :: struct
{
    /**< IN: Coded sequence width in pixels                                             */
    ulWidth: c.ulong,
    /**< IN: Coded sequence height in pixels                                            */
    ulHeight: c.ulong,
    /**< IN: Maximum number of internal decode surfaces                                 */
    ulNumDecodeSurfaces: c.ulong,
    /**< IN: cudaVideoCodec.XXX                                                         */
    CodecType: cudaVideoCodec,
    /**< IN: cudaVideoChromaFormat.XXX                                                  */
    ChromaFormat: cudaVideoChromaFormat,
    /**< IN: Decoder creation flags (cudaVideoCreateFlags_XXX)                          */
    ulCreationFlags: bit_set[cudaVideoCreateFlags; c.ulong],
    /**< IN: The value "BitDepth minus 8"                                               */
    bitDepthMinus8: c.ulong,
    /**< IN: Set 1 only if video has all intra frames (default value is 0). This will optimize video memory for Intra frames only decoding. The support is limited to specific codecs - H264, HEVC, VP9, the flag will be ignored for codecs which are not supported. However decoding might fail if the flag is enabled in case of supported codecs for regular bit streams having P and/or B frames.          */
    ulIntraDecodeOnly: c.ulong,
    /**< IN: Coded sequence max width in pixels used with reconfigure Decoder           */
    ulMaxWidth: c.ulong,
    /**< IN: Coded sequence max height in pixels used with reconfigure Decoder          */
    ulMaxHeight: c.ulong,
    /**< Reserved for future use - set to zero                                          */
    Reserved1: c.ulong,
    /** IN: area of the frame that should be displayed */
    display_area: Short_Rect,
    /**< IN: cudaVideoSurfaceFormat.XXX                                     */
    OutputFormat: cudaVideoSurfaceFormat,
    /**< IN: cudaVideoDeinterlaceMode.XXX                                   */
    DeinterlaceMode: cudaVideoDeinterlaceMode,
    /**< IN: Post-processed output width (Should be aligned to 2)           */
    ulTargetWidth: c.ulong,
    /**< IN: Post-processed output height (Should be aligned to 2)          */
    ulTargetHeight: c.ulong,
    /**< IN: Maximum number of output surfaces simultaneously mapped        */
    ulNumOutputSurfaces: c.ulong,
    /**< IN: If non-NULL, context lock used for synchronizing ownership of the cuda context. Needed for cudaVideoCreate_PreferCUDA decode     */
    vidLock: CUvideoctxlock,
    /** IN: target rectangle in the output frame (for aspect ratio conversion). if a null rectangle is specified, {0,0,ulTargetWidth,ulTargetHeight} will be used */
    target_rect: Short_Rect,
    /**< IN: enable histogram output, if supported */
    enableHistogram: c.ulong,
    /**< Reserved for future use - set to zero */
    Reserved2: [4]c.ulong,
}

CUVIDH264DPBENTRY :: struct {
    /**< picture index of reference frame                                        */
    PicIdx: c.int,
    /**< frame_num(short-term) or LongTermFrameIdx(long-term)                    */
    FrameIdx: c.int,
    /**< 0=short term reference, 1=long term reference                           */
    is_long_term: c.int,
    /**< non-existing reference frame (corresponding PicIdx should be set to -1) */
    not_existing: c.int,
    /**< 0=unused, 1=top_field, 2=bottom_field, 3=both_fields                    */
    used_for_reference: c.int,
    /**< field order count of top and bottom fields                              */
    FieldOrderCnt: [2]c.int,
}

CUVIDH264MVCEXT :: struct {
    /**< Max number of coded views minus 1 in video : Range - 0 to 1023              */
    num_views_minus1: c.int,
    /**< view identifier                                                             */
    view_id: c.int,
    /**< 1 if used for inter-view prediction, 0 if not                               */
    inter_view_flag: u8,
    /**< number of inter-view ref pics in RefPicList0                                */
    num_inter_view_refs_l0: u8,
    /**< number of inter-view ref pics in RefPicList1                                */
    num_inter_view_refs_l1: u8,
    /**< Reserved bits                                                               */
    MVCReserved8Bits: u8,
    /**< view id of the i-th view component for inter-view prediction in RefPicList0 */
    InterViewRefsL0: [16]c.int,
    /**< view id of the i-th view component for inter-view prediction in RefPicList1 */
    InterViewRefsL1: [16]c.int,
}

CUVIDH264SVCEXT :: struct {
    profile_idc: u8,
    level_idc: u8,
    DQId: u8,
    DQIdMax: u8,
    disable_inter_layer_deblocking_filter_idc: u8,
    ref_layer_chroma_phase_y_plus1: u8,
    inter_layer_slice_alpha_c0_offset_div2: i8,
    inter_layer_slice_beta_offset_div2: i8,

    DPBEntryValidFlag: c.ushort,
    inter_layer_deblocking_filter_control_present_flag: u8,
    extended_spatial_scalability_idc: u8,
    adaptive_tcoeff_level_prediction_flag: u8,
    slice_header_restriction_flag: u8,
    chroma_phase_x_plus1_flag: u8,
    chroma_phase_y_plus1: u8,

    tcoeff_level_prediction_flag: u8,
    constrained_intra_resampling_flag: u8,
    ref_layer_chroma_phase_x_plus1_flag: u8,
    store_ref_base_pic_flag: u8,
    Reserved8BitsA: u8,
    Reserved8BitsB: u8,

    scaled_ref_layer_left_offset: c.short,
    scaled_ref_layer_top_offset: c.short,
    scaled_ref_layer_right_offset: c.short,
    scaled_ref_layer_bottom_offset: c.short,
    Reserved16Bits: c.ushort,
    pNextLayer: ^CUVIDPICPARAMS, /**< Points to the picparams for the next layer to be decoded. Linked list ends at the target layer. */
    bRefBaseLayer: c.int,                  /**< whether to store ref base pic */
}

CUVIDMPEG2PICPARAMS :: struct {
    ForwardRefIdx: c.int,
    BackwardRefIdx: c.int,
    picture_coding_type: c.int,
    full_pel_forward_vector: c.int,
    full_pel_backward_vector: c.int,
    f_code: [2][2]c.int,
    intra_dc_precision: c.int,
    frame_pred_frame_dct: c.int,
    concealment_motion_vectors: c.int,
    q_scale_type: c.int,
    intra_vlc_format: c.int,
    alternate_scan: c.int,
    top_field_first: c.int,
    // Quantization matrices (raster order)
    QuantMatrixIntra: [64]u8,
    QuantMatrixInter: [64]u8,
}

CUVIDH264PICPARAMS :: struct {
    // SPS
    log2_max_frame_num_minus4: c.int,
    pic_order_cnt_type: c.int,
    log2_max_pic_order_cnt_lsb_minus4: c.int,
    delta_pic_order_always_zero_flag: c.int,
    frame_mbs_only_flag: c.int,
    direct_8x8_inference_flag: c.int,
    num_ref_frames: c.int,
    residual_colour_transform_flag: u8,
    bit_depth_luma_minus8: u8,
    bit_depth_chroma_minus8: u8,
    qpprime_y_zero_transform_bypass_flag: u8,
    // PPS
    entropy_coding_mode_flag: c.int,
    pic_order_present_flag: c.int,
    num_ref_idx_l0_active_minus1: c.int,
    num_ref_idx_l1_active_minus1: c.int,
    weighted_pred_flag: c.int,
    weighted_bipred_idc: c.int,
    pic_init_qp_minus26: c.int,
    deblocking_filter_control_present_flag: c.int,
    redundant_pic_cnt_present_flag: c.int,
    transform_8x8_mode_flag: c.int,
    MbaffFrameFlag: c.int,
    constrained_intra_pred_flag: c.int,
    chroma_qp_index_offset: c.int,
    second_chroma_qp_index_offset: c.int,
    ref_pic_flag: c.int,
    frame_num: c.int,
    CurrFieldOrderCnt: [2]c.int,
    // DPB
    dpb: [16]CUVIDH264DPBENTRY, // List of reference frames within the DPB
    // Quantization Matrices (raster-order)
    WeightScale4x4: [6][16]u8,
    WeightScale8x8: [2][64]u8,
    // FMO/ASO
    fmo_aso_enable: u8,
    num_slice_groups_minus1: u8,
    slice_group_map_type: u8,
    pic_init_qs_minus26: i8,
    slice_group_change_rate_minus1: c.uint,
    fmo: struct #raw_union {
        slice_group_map_addr: u64,
        pMb2SliceGroupMap: ^u8,
    },

    mb_adaptive_frame_field_flag: c.uint,  // bit 0 represent SPS flag mb_adaptive_frame_field_flag. if bit 1 is not set, flag is ignored. Bit 1 is set to maintain backward compatibility

    Reserved: [11]c.uint,
    // SVC/MVC
    svc_mvc : struct #raw_union {
        svcext: CUVIDH264MVCEXT,
        mvcext: CUVIDH264SVCEXT,
    },
}

CUVIDEOFORMAT_SIGNAL_DESCRIPTION_VIDEO_FORMAT :: enum(u8) {
    Component,
    Pal,
    NTSC,
    SECAM,
    MAC,
    Unspecified
}

CUAUDIOFORMAT :: struct {
    /**< OUT: Compression format                                              */
    codec: cudaAudioCodec,
    /**< OUT: number of audio channels                                        */
    channels: c.uint,
    /**< OUT: sampling frequency                                              */
    samplespersec: c.uint,
    /**< OUT: For uncompressed, can also be used to determine bits per sample */
    bitrate: c.uint,
    /**< Reserved for future use                                              */
    reserved1: c.uint,
    /**< Reserved for future use                                              */
    reserved2: c.uint,
}


cudaAudioCodec :: enum(c.int) {
    /**< MPEG-1 Audio               */
    MPEG1=0,
    /**< MPEG-2 Audio               */
    MPEG2,
    /**< MPEG-1 Layer III Audio     */
    MP3,
    /**< Dolby Digital (AC3) Audio  */
    AC3,
    /**< PCM Audio                  */
    LPCM,
    /**< AAC Audio                  */
    AAC,
}

VideoSignalDescription :: struct {
    using packed : bit_field u8 {
        /**< OUT: 0-Component, 1-PAL, 2-NTSC, 3-SECAM, 4-MAC, 5-Unspecified */
        video_format          :CUVIDEOFORMAT_SIGNAL_DESCRIPTION_VIDEO_FORMAT | 3,
        /**< OUT: indicates the black level and luma and chroma range */
        video_full_range_flag :bool | 1,
        /**< Reserved bits */
        reserved_zero_bits    :u8 | 4,
    },
    /**< OUT: chromaticity coordinates of source primaries                  */
    color_primaries: u8,
    /**< OUT: opto-electronic transfer characteristic of the source picture */
    transfer_characteristics: u8,
    /**< OUT: used in deriving luma and chroma signals from RGB primaries   */
    matrix_coefficients: u8,
}

CUVIDEOFORMAT :: struct {
    /**< OUT: Compression format */
    codec: cudaVideoCodec,
   /**
    * OUT: frame rate = numerator / denominator (for example: 30000/1001)
    */
    frame_rate : struct {
        /**< OUT: frame rate numerator   (0 = unspecified or variable frame rate) */
        numerator: c.uint,
        /**< OUT: frame rate denominator (0 = unspecified or variable frame rate) */
        denominator: c.uint,
    },
    /**< OUT: 0=interlaced, 1=progressive                                      */
    progressive_sequence: u8,
    /**< OUT: high bit depth luma. E.g, 2 for 10-bitdepth, 4 for 12-bitdepth   */
    bit_depth_luma_minus8: u8,
    /**< OUT: high bit depth chroma. E.g, 2 for 10-bitdepth, 4 for 12-bitdepth */
    bit_depth_chroma_minus8: u8,
    /**< OUT: Minimum number of decode surfaces to be allocated for correct
        decoding. The client can send this value in ulNumDecodeSurfaces
        (in CUVIDDECODECREATEINFO structure).
        This guarantees correct functionality and optimal video memory
        usage but not necessarily the best performance, which depends on
        the design of the overall application. The optimal number of
        decode surfaces (in terms of performance and memory utilization)
        should be decided by experimentation for each application, but it
        cannot go below min_num_decode_surfaces.
        If this value is used for ulNumDecodeSurfaces then it must be
        returned to parser during sequence callback.                     */
    min_num_decode_surfaces: u8,
    /**< OUT: coded frame width in pixels */
    coded_width: c.uint,
    /**< OUT: coded frame height in pixels */
    coded_height: c.uint,
   /**
    * area of the frame that should be displayed
    * typical example:
    * coded_width = 1920, coded_height = 1088
    * display_area = { 0,0,1920,1080 }
    */
    display_area: struct {
        /**< OUT: left position of display rect    */
        left: c.int,
        /**< OUT: top position of display rect     */
        top: c.int,
        /**< OUT: right position of display rect   */
        right: c.int,
        /**< OUT: bottom position of display rect  */
        bottom: c.int,
    },
    /**< OUT:  Chroma format */
    chroma_format: cudaVideoChromaFormat,
    /**< OUT: video bitrate (bps, 0=unknown) */
    bitrate: c.uint,
   /**
    * OUT: Display Aspect Ratio = x:y (4:3, 16:9, etc)
    */
    display_aspect_ratio: struct {
        x: c.int,
        y: c.int,
    },
    /**
    * Video Signal Description
    * Refer section E.2.1 (VUI parameters semantics) of H264 spec file
    */
    video_signal_description: VideoSignalDescription,
    seqhdr_data_length: c.uint,             /**< OUT: Additional bytes following (CUVIDEOFORMATEX)                  */
}

CUVIDAV1SEQHDR :: struct {
    max_width: c.uint,
    max_height: c.uint,
    reserved: [1016]u8,
} 

CUVIDEOFORMATEX :: struct {
    /**< OUT: CUVIDEOFORMAT structure */
    format: CUVIDEOFORMAT,
    using header: struct #raw_union {
        av1: CUVIDAV1SEQHDR,
        /**< OUT: Sequence header data    */
        raw_seqhdr_data: [1024]u8,
    },
}

CUVIDVC1PICPARAMS :: struct {
    ForwardRefIdx: c.int,
    BackwardRefIdx: c.int,
    FrameWidth: c.int,
    FrameHeight: c.int,
    intra_pic_fla: c.int,
    ref_pic_fla: c.int,
    progressive_fc: c.int,
    profile: c.int,
    postprocflag: c.int,
    pulldown: c.int,
    interlace: c.int,
    tfcntrflag: c.int,
    finterpflag: c.int,
    psf: c.int,
    multires: c.int,
    syncmarker: c.int,
    rangered: c.int,
    maxbframes: c.int,
    panscan_flag: c.int,
    refdist_flag: c.int,
    extended_mv: c.int,
    dquant: c.int,
    vstransform: c.int,
    loopfilter: c.int,
    fastuvmc: c.int,
    overlap: c.int,
    quantizer: c.int,
    extended_dmv: c.int,
    range_mapy_flag: c.int,
    range_mapy: c.int,
    range_mapuv_flag: c.int,
    range_mapuv: c.int,
    rangeredfrm: c.int,
}


CUVIDHEVCPICPARAMS :: struct {
    pic_width_in_luma_samples: c.int,
    pic_height_in_luma_samples: c.int,
    log2_min_luma_coding_block_size_minus3: u8,
    log2_diff_max_min_luma_coding_block_size: u8,
    log2_min_transform_block_size_minus2: u8,
    log2_diff_max_min_transform_block_size: u8,
    pcm_enabled_flag: u8,
    log2_min_pcm_luma_coding_block_size_minus3: u8,
    log2_diff_max_min_pcm_luma_coding_block_size: u8,
    pcm_sample_bit_depth_luma_minus1: u8,
    pcm_sample_bit_depth_chroma_minus1: u8,
    pcm_loop_filter_disabled_flag: u8,
    strong_intra_smoothing_enabled_flag: u8,
    max_transform_hierarchy_depth_intra: u8,
    max_transform_hierarchy_depth_inter: u8,
    amp_enabled_flag: u8,
    separate_colour_plane_flag: u8,
    log2_max_pic_order_cnt_lsb_minus4: u8,
    num_short_term_ref_pic_sets: u8,
    long_term_ref_pics_present_flag: u8,
    num_long_term_ref_pics_sps: u8,
    sps_temporal_mvp_enabled_flag: u8,
    sample_adaptive_offset_enabled_flag: u8,
    scaling_list_enable_flag: u8,
    IrapPicFlag: u8,
    IdrPicFlag: u8,
    bit_depth_luma_minus8: u8,
    bit_depth_chroma_minus8: u8,
    log2_max_transform_skip_block_size_minus2: u8,
    log2_sao_offset_scale_luma: u8,
    log2_sao_offset_scale_chroma: u8,
    high_precision_offsets_enabled_flag: u8,
    reserved1: [10]u8,
    dependent_slice_segments_enabled_flag: u8,
    slice_segment_header_extension_present_flag: u8,
    sign_data_hiding_enabled_flag: u8,
    cu_qp_delta_enabled_flag: u8,
    diff_cu_qp_delta_depth: u8,
    init_qp_minus26:i8,
    pps_cb_qp_offset:i8,
    pps_cr_qp_offset:i8,
    constrained_intra_pred_flag: u8,
    weighted_pred_flag: u8,
    weighted_bipred_flag: u8,
    transform_skip_enabled_flag: u8,
    transquant_bypass_enabled_flag: u8,
    entropy_coding_sync_enabled_flag: u8,
    log2_parallel_merge_level_minus2: u8,
    num_extra_slice_header_bits: u8,
    loop_filter_across_tiles_enabled_flag: u8,
    loop_filter_across_slices_enabled_flag: u8,
    output_flag_present_flag: u8,
    num_ref_idx_l0_default_active_minus1: u8,
    num_ref_idx_l1_default_active_minus1: u8,
    lists_modification_present_flag: u8,
    cabac_init_present_flag: u8,
    pps_slice_chroma_qp_offsets_present_flag: u8,
    deblocking_filter_override_enabled_flag: u8,
    pps_deblocking_filter_disabled_flag: u8,
    pps_beta_offset_div2:i8,
    pps_tc_offset_div2:i8,
    tiles_enabled_flag: u8,
    uniform_spacing_flag: u8,
    num_tile_columns_minus1: u8,
    num_tile_rows_minus1: u8,
    column_width_minus1: [21]c.ushort,
    row_height_minus1: [21]c.ushort,
    sps_range_extension_flag: u8,
    transform_skip_rotation_enabled_flag: u8,
    transform_skip_context_enabled_flag: u8,
    implicit_rdpcm_enabled_flag: u8,
    explicit_rdpcm_enabled_flag: u8,
    extended_precision_processing_flag: u8,
    intra_smoothing_disabled_flag: u8,
    persistent_rice_adaptation_enabled_flag: u8,
    cabac_bypass_alignment_enabled_flag: u8,
    pps_range_extension_flag: u8,
    cross_component_prediction_enabled_flag: u8,
    chroma_qp_offset_list_enabled_flag: u8,
    diff_cu_chroma_qp_offset_depth: u8,
    chroma_qp_offset_list_len_minus1: u8,
    cb_qp_offset_list: [6]i8,
    cr_qp_offset_list: [6]i8,
    reserved2: [2]u8,
    reserved3: [8]c.uint,
    NumBitsForShortTermRPSInSlice: c.int,
    NumDeltaPocsOfRefRpsIdx: c.int,
    NumPocTotalCurr: c.int,
    NumPocStCurrBefore: c.int,
    NumPocStCurrAfter: c.int,
    NumPocLtCurr: c.int,
    CurrPicOrderCntVal: c.int,
    RefPicIdx: [16]c.int,
    PicOrderCntVal: [16]c.int,
    IsLongTerm: [16]u8,
    RefPicSetStCurrBefore: [8]u8,
    RefPicSetStCurrAfter: [8]u8,
    RefPicSetLtCurr: [8]u8,
    RefPicSetInterLayer0: [8]u8,
    RefPicSetInterLayer1: [8]u8,
    reserved4: [12]c.uint,
    ScalingList4x4: [6][16]u8,
    ScalingList8x8: [6][64]u8,
    ScalingList16x16: [6][64]u8,
    ScalingList32x32: [2][64]u8,
    ScalingListDCCoeff16x16: [6]u8,
    ScalingListDCCoeff32x32: [2]u8,
}

CUVIDMPEG4PICPARAMS :: struct {
    ForwardRefIdx: c.int,
    BackwardRefIdx: c.int,
    video_object_layer_width: c.int,
    video_object_layer_height: c.int,
    vop_time_increment_bitcount: c.int,
    top_field_first: c.int,
    resync_marker_disable: c.int,
    quant_type: c.int,
    quarter_sample: c.int,
    short_video_header: c.int,
    divx_flags: c.int,
    vop_coding_type: c.int,
    vop_coded: c.int,
    vop_rounding_type: c.int,
    alternate_vertical_scan_flag: c.int,
    interlaced: c.int,
    vop_fcode_forward: c.int,
    vop_fcode_backward: c.int,
    trd: [2]c.int,
    trb: [2]c.int,
    QuantMatrixIntra: [64]u8,
    QuantMatrixInter: [64]u8,
    gmc_enabled: c.int,
}

CUVIDJPEGPICPARAMS :: struct {
    numComponents: u8,
    bitDepth: u8,
    quantizationTableSelector: [4]u8,
    scanOffset: [4]c.uint,
    scanSize: [4]c.uint,
    restartInterval: c.ushort,
    componentIdentifier: [4]u8,
    hasQMatrix: u8,
    hasHuffman: u8,
    quantvals: [4][64]c.ushort,
    bits_ac: [4][16]u8,
    table_ac: [4][256]u8,
    bits_dc: [4][16]u8,
    table_dc: [4][256]u8,
}

CUVIDPICPARAMS :: struct {
    /**< IN: Coded frame size in macroblocks */
    PicWidthInMbs: c.int,
    /**< IN: Coded frame height in macroblocks */
    FrameHeightInMbs: c.int,
    /**< IN: Output index of the current picture */
    CurrPicIdx: c.int,
    /**< IN: 0=frame picture, 1=field picture */
    field_pic_flag: c.int,
    /**< IN: 0=top field, 1=bottom field (ignored if field_pic_flag=0) */
    bottom_field_flag: c.int,
    /**< IN: Second field of a complementary field pair */
    second_field: c.int,
    // Bitstream data
    /**< IN: Number of bytes in bitstream data buffer*/
    nBitstreamDataLen: c.uint,
    /**< IN: Ptr to bitstream data for this picture (slice-layer)*/
    pBitstreamData: ^u8,
    /**< IN: Number of slices in this picture*/
    nNumSlices: c.uint,
    /**< IN: nNumSlices entries, contains offset of each slice within the bitstream data buffer*/
    pSliceDataOffsets: ^c.uint,
    /**< IN: This picture is a reference picture */
    ref_pic_flag: c.int,
    /**< IN: This picture is entirely intra coded */
    intra_pic_flag: c.int,
    /**< Reserved for future use */
    Reserved: [30]c.uint,
    // IN: Codec-specific data
    CodecSpecific: struct #raw_union {
        /**< Also used for MPEG-1 */
        mpeg2: CUVIDMPEG2PICPARAMS,
        h264: CUVIDH264PICPARAMS,
        vc1: CUVIDVC1PICPARAMS,
        mpeg4: CUVIDMPEG4PICPARAMS,
        jpeg: CUVIDJPEGPICPARAMS,
        hevc: CUVIDHEVCPICPARAMS,
        vp8: CUVIDVP8PICPARAMS,
        vp9: CUVIDVP9PICPARAMS,
        av1: CUVIDAV1PICPARAMS,
        CodecReserved: [1024]c.uint,
    }
}

CUVIDAV1PICPARAMS :: struct {
    width: c.uint,
    height: c.uint,
    frame_offset: c.uint,
    decodePicIdx: c.int,
    using packed1: bit_field u32 {
        profile:c.uint | 3,
        use_128x128_superblock:c.uint | 1,
        subsampling_x:c.uint | 1,
        subsampling_y:c.uint | 1,
        mono_chrome:c.uint | 1,
        bit_depth_minus8:c.uint | 4,
        enable_filter_intra:c.uint | 1,
        enable_intra_edge_filter:c.uint | 1,
        enable_interintra_compound:c.uint | 1,
        enable_masked_compound:c.uint | 1,
        enable_dual_filter:c.uint | 1,
        enable_order_hint:c.uint | 1,
        order_hint_bits_minus1:c.uint | 3,
        enable_jnt_comp:c.uint | 1,
        enable_superres:c.uint | 1,
        enable_cdef:c.uint | 1,
        enable_restoration:c.uint | 1,
        enable_fgs:c.uint | 1,
        reserved0_7bits:c.uint | 7,
    },
    using packed2: bit_field u32 {
        frame_type:c.uint | 2,
        show_frame:c.uint | 1,
        disable_cdf_update:c.uint | 1,
        allow_screen_content_tools:c.uint | 1,
        force_integer_mv:c.uint | 1,
        coded_denom:c.uint | 3,
        allow_intrabc:c.uint | 1,
        allow_high_precision_mv:c.uint | 1,
        interp_filter:c.uint | 3,
        switchable_motion_mode:c.uint | 1,
        use_ref_frame_mvs:c.uint | 1,
        disable_frame_end_update_cdf:c.uint | 1,
        delta_q_present:c.uint | 1,
        delta_q_res:c.uint | 2,
        using_qmatrix:c.uint | 1,
        coded_lossless:c.uint | 1,
        use_superres:c.uint | 1,
        tx_mode:c.uint | 2,
        reference_mode:c.uint | 1,
        allow_warped_motion:c.uint | 1,
        reduced_tx_set:c.uint | 1,
        skip_mode:c.uint | 1,
        reserved1_3bits:c.uint | 3,
    },
    using packed3: bit_field u32 {
        num_tile_cols: c.uint | 8,
        num_tile_rows: c.uint | 8,
        context_update_tile_id: c.uint | 16,
    },
    tile_widths: [64]c.ushort,
    tile_heights: [64]c.ushort,
    using packed4: bit_field u8 {
        cdef_damping_minus_3: u8 | 2,
        cdef_bits: u8 | 2,
        reserved2_4bits: u8 | 4,
    },
    cdef_y_strength: [8]u8,
    cdef_uv_strength: [8]u8,
    using packed5: bit_field u8 {
        SkipModeFrame0: u8 | 4,
        SkipModeFrame1: u8 | 4,
    },
    base_qindex: u8,
    qp_y_dc_delta_q: i8,
    qp_u_dc_delta_q: i8,
    qp_v_dc_delta_q: i8,
    qp_u_ac_delta_q: i8,
    qp_v_ac_delta_q: i8,
    qm_y: u8,
    qm_u: u8,
    qm_v: u8,
    using packed6: bit_field u8 {
        segmentation_enabled: u8 | 1,
        segmentation_update_map: u8 | 1,
        segmentation_update_data: u8 | 1,
        segmentation_temporal_update: u8 | 1,
        reserved3_4bits: u8 | 4,
    },
    segmentation_feature_data: [8][8]c.short,
    segmentation_feature_mask: [8]u8,
    loop_filter_level: [2]u8,
    loop_filter_level_u: u8,
    loop_filter_level_v: u8,
    loop_filter_sharpness: u8,
    loop_filter_ref_deltas: [8]i8,
    loop_filter_mode_deltas: [2]i8,
    using packed7: bit_field u8 {
        loop_filter_delta_enabled: u8 | 1,
        loop_filter_delta_update: u8 | 1,
        delta_lf_present: u8 | 1,
        delta_lf_res: u8 | 2,
        delta_lf_multi : u8 | 1,
        reserved4_2bits: u8 | 2,
    },
    lr_unit_size: [3]u8,
    lr_type: [3]u8,
    primary_ref_frame: u8,
    ref_frame_map: [8]u8,
    using packed8: bit_field u8 {
        temporal_layer_id: u8 | 4,
        spatial_layer_id: u8 | 4,
    },
    reserved5_32bits: [4]u8,
    ref_frame: [7]struct {
        width: c.uint,
        height: c.uint,
        index: u8,
        reserved24Bits: [3]u8,
    },
    global_motion: [7]struct {
        using packed: bit_field u8 {
            invalid: u8 | 1,
            wmtype: u8 | 2,
            reserved5Bits: u8 | 5,
        },
        reserved24Bits: [3]i8,
        wmmat: [6]c.int,
    },
    using packed9: bit_field u16 {
        apply_grain: c.ushort | 1,
        overlap_flag: c.ushort | 1,
        scaling_shift_minus8: c.ushort | 2,
        chroma_scaling_from_luma: c.ushort | 1,
        ar_coeff_lag: c.ushort | 2,
        ar_coeff_shift_minus6: c.ushort | 2,
        grain_scale_shift: c.ushort | 2,
        clip_to_restricted_range: c.ushort | 1,
        reserved6_4bits: c.ushort | 4,
    },
    num_y_points: u8,
    scaling_points_y: [14][2]u8,
    num_cb_points: u8,
    scaling_points_cb: [10][2]u8,
    num_cr_points: u8,
    scaling_points_cr: [10][2]u8,
    reserved7_8bits: u8,
    random_seed: c.ushort,
    ar_coeffs_y: [24]c.short,
    ar_coeffs_cb: [25]c.short,
    ar_coeffs_cr: [25]c.short,
    cb_mult: u8,
    cb_luma_mult: u8,
    cb_offset: c.short,
    cr_mult: u8,
    cr_luma_mult: u8,
    cr_offset: c.short,
    reserved: [7]c.int,
}

CUVIDVP9PICPARAMS :: struct {
    width: c.uint,
    height: c.uint,
    LastRefIdx: u8,
    GoldenRefIdx: u8,
    AltRefIdx: u8,
    colorSpace: u8,
    using packed1: bit_field c.ushort{
        profile: c.ushort | 3,
        frameContextIdx: c.ushort | 2,
        frameType: c.ushort | 1,
        showFrame: c.ushort | 1,
        errorResilient: c.ushort | 1,
        frameParallelDecoding: c.ushort | 1,
        subSamplingX: c.ushort | 1,
        subSamplingY: c.ushort | 1,
        intraOnly: c.ushort | 1,
        allow_high_precision_mv: c.ushort | 1,
        refreshEntropyProbs: c.ushort | 1,
        reserved2Bits: c.ushort | 2,
    },
    reserved16Bits: c.ushort,
    refFrameSignBias: [4]u8,
    bitDepthMinus8Luma: u8,
    bitDepthMinus8Chroma: u8,
    loopFilterLevel: u8,
    loopFilterSharpness: u8,
    modeRefLfEnabled: u8,
    log2_tile_columns: u8,
    log2_tile_rows: u8,
    using packed2: bit_field u8 {
        segmentEnabled: u8 | 1,
        segmentMapUpdate: u8 | 1,
        segmentMapTemporalUpdate: u8 | 1,
        segmentFeatureMode: u8 | 1,
        reserved4Bits: u8 | 4,
    },
    segmentFeatureEnable: [8][4]u8,
    segmentFeatureData: [8][4]c.short,
    mb_segment_tree_probs: [7]u8,
    segment_pred_probs: [3]u8,
    reservedSegment16Bits: [2]u8,
    qpYAc: c.int,
    qpYDc: c.int,
    qpChDc: c.int,
    qpChAc: c.int,
    activeRefIdx: [3]c.uint,
    resetFrameContext: c.uint,
    mcomp_filter_type: c.uint,
    mbRefLfDelta: [4]c.uint,
    mbModeLfDelta: [2]c.uint,
    frameTagSize: c.uint,
    offsetToDctParts: c.uint,
    reserved128Bits: [4]c.uint,
}

CUVIDVP8PICPARAMS :: struct {
    width: c.int,
    height: c.int,
    first_partition_size: c.uint,
    LastRefIdx: u8,
    GoldenRefIdx: u8,
    AltRefIdx: u8,
    inner: struct #raw_union {
        vp8_frame_tag: bit_field u8 {
            frame_type :u8 | 1,
            version :u8 | 3,
            show_frame :u8 | 1,
            update_mb_segmentation_data :u8 | 1,
            Reserved2Bits :u8 | 2,
        },
        wFrameTagFlags: u8,
    },
    Reserved1: [4]u8,
    Reserved2: [3]c.uint,
}


CUVIDPARSERDISPINFO :: struct {
     /**< OUT: Index of the current picture */
    picture_index: c.int,
     /**< OUT: 1 if progressive frame; 0 otherwise */
    progressive_frame: c.int,
     /**< OUT: 1 if top field is displayed first; 0 otherwise */
    top_field_first: c.int,
     /**< OUT: Number of additional fields (1=ivtc, 2=frame doubling, 4=frame tripling, -1=unpaired field) */
    repeat_first_field: c.int,
     /**< OUT: Presentation time stamp */
    timestamp: CUvideotimestamp,
}

CUVIDRECONFIGUREDECODERINFO :: struct {
    /**< IN: Coded sequence width in pixels, MUST be < = ulMaxWidth defined at CUVIDDECODECREATEINFO  */
    ulWidth: c.uint,
    /**< IN: Coded sequence height in pixels, MUST be < = ulMaxHeight defined at CUVIDDECODECREATEINFO  */
    ulHeight: c.uint,
    /**< IN: Post processed output width */
    ulTargetWidth: c.uint,
    /**< IN: Post Processed output height */
    ulTargetHeight: c.uint,
    /**< IN: Maximum number of internal decode surfaces */
    ulNumDecodeSurfaces: c.uint,
    /**< Reserved for future use. Set to Zero */
    reserved1: [12]c.uint,
    /**
    * IN: Area of frame to be displayed. Use-case : Source Cropping
    */
    display_area : Short_Rect,
    /**
    * IN: Target Rectangle in the OutputFrame. Use-case : Aspect ratio Conversion
    */
    target_rect: Short_Rect,
    reserved2: [11]c.uint, /**< Reserved for future use. Set to Zero */
}

CUVIDOPERATINGPOINTINFO :: struct {
    codec: cudaVideoCodec,
    using codecInfo: struct #raw_union {
        av1: struct {
            operating_points_cnt: u8,
            reserved24_bits: [3]u8,
            operating_points_idc: [32]c.ushort,
        },
        CodecReserved: [1024]u8,
    }
}

CUSEIMESSAGE :: struct {
    /**< OUT: SEI Message Type      */
    sei_message_type: u8,
    reserved: [3]u8,
    /**< OUT: SEI Message Size      */
    sei_message_size: c.uint,
} 

CUVIDSEIMESSAGEINFO :: struct {
    /**< OUT: SEI Message Data      */
    pSEIData: rawptr,
    /**< OUT: SEI Message Info      */
    pSEIMessage: ^CUSEIMESSAGE,
    /**< OUT: SEI Message Count     */
    sei_message_count: c.uint,
    /**< OUT: SEI Message Pic Index */
    picIdx: c.uint,
} 

CUVIDPARSERPARAMS :: struct($T: typeid) {
    /**< IN: cudaVideoCodec.XXX */
    CodecType: cudaVideoCodec,
    /**< IN: Max # of decode surfaces (parser will cycle through these)          */
    ulMaxNumDecodeSurfaces: c.uint,
    /**< IN: Timestamp units in Hz (0=default=10000000Hz)                        */
    ulClockRate: c.uint,
    /**< IN: % Error threshold (0-100) for calling pfnDecodePicture (100=always IN: call pfnDecodePicture even if picture bitstream is fully corrupted) */
    ulErrorThreshold: c.uint,
    /**< IN: Max display queue delay (improves pipelining of decode with display) 0=no delay (recommended values: 2..4)                               */
    ulMaxDisplayDelay: c.uint,
    using packed: bit_field c.uint {
        bAnnexb: bool | 1, /**< IN: AV1 annexB stream */
        bMemoryOptimize: c.uint | 1, /**< IN: Utilize minimum picIdx from dpb to allow memory saving at the decoder layer, use cuvidReconfigureDecoder() to increase the decode surfaces if needed  (perf may get impacted) */
        uReserved: c.uint | 30,/**< Reserved for future use - set to zero */
    },
    /**< IN: Reserved for future use - set to 0 */
    uReserved1: [4]c.uint,
    /**< IN: User data for callbacks */
    pUserData: rawptr,
    /**< IN: Called before decoding frames and/or whenever there is a fmt change */
    pfnSequenceCallback: proc "c" (user_data: ^T, format_info: ^CUVIDEOFORMAT) -> c.int,
    /**< IN: Called when a picture is ready to be decoded (decode order) */
    pfnDecodePicture: proc "c" (user_data: ^T, decode_info: ^CUVIDPICPARAMS) -> c.int,
    /**< IN: Called whenever a picture is ready to be displayed (display order) */
    pfnDisplayPicture: proc "c" (user_data: ^T, display_info: ^CUVIDPARSERDISPINFO) -> c.int,
    /**< IN: Called from AV1 sequence header to get operating point of a AV1 scalable bitstream */
    pfnGetOperatingPoint: proc "c" (user_data: ^T, point_info: ^CUVIDOPERATINGPOINTINFO) -> c.int,
    /**< IN: Called when all SEI messages are parsed for particular frame */
    pfnGetSEIMsg: proc "c" (user_data: ^T, sei_info: ^CUVIDSEIMESSAGEINFO) -> c.int,
    /**< Reserved for future use - set to NULL */
    pvReserved2: [5]rawptr,
    /**< IN: [Optional] sequence header data from system layer */
    pExtVideoInfo: ^CUVIDEOFORMATEX,
}

CUvideopacketflag :: enum(c.int) {
    /**< Set when this is the last packet for this stream */
    ENDOFSTREAM,
    /**< Timestamp is valid */
    TIMESTAMP,
    /**< Set when a discontinuity has to be signalled */
    DISCONTINUITY,
    /**< Set when the packet contains exactly one frame or one field */
    ENDOFPICTURE,
    /**< If this flag is set along with CUVID_PKT_ENDOFSTREAM, an additional (dummy) display callback will be invoked with null value of CUVIDPARSERDISPINFO which should be interpreted as end of the stream. */
    NOTIFY_EOS,
}

CUVIDSOURCEDATAPACKET :: struct {
    flags: bit_set[CUvideopacketflag; c.ulong],            /**< IN: Combination of CUVID_PKT_XXX flags */
    payload_size: c.ulong,     /**< IN: number of bytes in the payload (may be zero if EOS flag is set) */
    payload: [^]u8,   /**< IN: Pointer to packet payload data (may be NULL if EOS flag is set) */
    timestamp: CUvideotimestamp     /**< IN: Presentation time stamp (10MHz clock), only valid if CUVID_PKT_TIMESTAMP flag is set */
}

cuvidDecodeStatus :: enum(c.int)
{
    /* Decode status is not valid */
    Invalid         = 0,
    /* Decode is in progress */
    InProgress      = 1,
    /* Decode is completed without any errors */
    Success         = 2,
    // 3 to 7 enums are reserved for future use
    /* Decode is completed with an error (error is not concealed) */
    Error           = 8,
    /* Decode is completed with an error and error is concealed */
    Error_Concealed = 9,
}
CUVIDGETDECODESTATUS :: struct {
    decodeStatus: cuvidDecodeStatus,
    reserved: [31]c.uint,
    pReserved: [8]rawptr,
}

CUVIDPROCPARAMS :: struct {
    /**< IN: Input is progressive (deinterlace_mode will be ignored)                */
    progressive_frame: c.int,
    /**< IN: Output the second field (ignored if deinterlace mode is Weave)         */
    second_field: c.int,
    /**< IN: Input frame is top field first (1st field is top, 2nd field is bottom) */
    top_field_first: c.int,
    /**< IN: Input only contains one field (2nd field is invalid)                   */
    unpaired_field: c.int,
    // The fields below are used for raw YUV input
    /**< Reserved for future use (set to zero)                                      */
    reserved_flags: c.uint,
    /**< Reserved (set to zero)                                                     */
    reserved_zero: c.uint,
    /**< IN: Input CUdeviceptr for raw YUV extensions                               */
    raw_input_dptr: cuda.CUdeviceptr,
    /**< IN: pitch in bytes of raw YUV input (should be aligned appropriately)      */
    raw_input_pitch: c.uint,
    /**< IN: Input YUV format (cudaVideoCodec_enum)                                 */
    raw_input_format: c.uint,
    /**< IN: Output CUdeviceptr for raw YUV extensions                              */
    raw_output_dptr: cuda.CUdeviceptr,
    /**< IN: pitch in bytes of raw YUV output (should be aligned appropriately)     */
    raw_output_pitch: c.uint,
    /**< Reserved for future use (set to zero)                                      */
    Reserved1: c.uint,
    /**< IN: stream object used by cuvidMapVideoFrame                               */
    output_stream: cuda.CUstream,
    /**< Reserved for future use (set to zero)                                      */
    Reserved: [46]c.uint,
    /**< OUT: Output CUdeviceptr for histogram extensions                           */
    histogram_dptr: ^cuda.CUdeviceptr,
    /**< Reserved for future use (set to zero)                                      */
    Reserved2: [1]rawptr,
}

CUVIDSOURCEPARAMS :: struct($T: typeid) {
    /**< IN: Time stamp units in Hz (0=default=10000000Hz)      */
    ulClockRate: c.uint,
    using packed : bit_field u32 {
        /**< IN: AV1 annexB stream                                  */
        bAnnexb: u32 | 1,
        /**< Reserved for future use - set to zero                  */
        uReserved: u32 | 31,
    },
    /**< Reserved for future use - set to zero                  */
    uReserved1: [6]c.uint,
    /**< IN: User private data passed in to the data handlers   */
    pUserData: T,
    /**< IN: Called to deliver video packets                    */
    pfnVideoDataHandler:  proc(user_data: ^T, arg: CUVIDSOURCEDATAPACKET) -> int,
    /**< IN: Called to deliver audio packets.                   */
    pfnAudioDataHandler:  proc(user_data: ^T, arg: CUVIDSOURCEDATAPACKET) -> int,
    /**< Reserved for future use - set to NULL                  */
    pvReserved2: [8]rawptr
}

CUvideodecoder :: distinct rawptr
/**
 *
 * Context-locking: to facilitate multi-threaded implementations, the following 4 functions
 * provide a simple mutex-style host synchronization. If a non-NULL context is specified
 * in CUVIDDECODECREATEINFO, the codec library will acquire the mutex associated with the given
 * context before making any cuda calls.
 * A multi-threaded application could create a lock associated with a context handle so that
 * multiple threads can safely share the same cuda context:
 *  - use cuCtxPopCurrent immediately after context creation in order to create a 'floating' context
 *    that can be passed to cuvidCtxLockCreate.
 *  - When using a floating context, all cuda calls should only be made within a cuvidCtxLock/cuvidCtxUnlock section.
 *
 * NOTE: This is a safer alternative to cuCtxPushCurrent and cuCtxPopCurrent, and is not related to video
 * decoder in any way (implemented as a critical section associated with cuCtx{Push|Pop}Current calls).
*/
CUvideoctxlock :: distinct rawptr
CUvideoparser :: distinct rawptr
CUvideosource :: distinct rawptr
CUvideotimestamp :: i64

/** Return extended format structure (CUVIDEOFORMATEX) */
CUVID_FMT_EXTFORMATINFO :: 0x100

Rect :: struct($T: typeid) {
    left: T,
    top: T,
    right: T,
    bottom: T,
}

Longlong_Rect :: Rect(c.longlong)
Long_Rect :: Rect(c.long)
Int_Rect :: Rect(c.int)
Short_Rect :: Rect(c.short)

cudaVideoState :: enum(c.int) {
    /**< Error state (invalid source)                  */
    Error   = -1,
    /**< Source is stopped (or reached end-of-stream)  */
    Stopped = 0,
    /**< Source is running and delivering data         */
    Started = 1
}

foreign import lib "system:libnvcuvid.so"
@(default_calling_convention = "stdcall" when (ODIN_OS == .Windows) else "c")
foreign lib {
    cuvidGetDecoderCaps :: proc (pdc: ^CUVIDDECODECAPS) -> cuda.CUresult ---
    cuvidCreateDecoder :: proc (phDecoder: ^CUvideodecoder, pdci: ^CUVIDDECODECREATEINFO) -> cuda.CUresult ---
    cuvidDecodePicture :: proc (hDecoder: CUvideodecoder, pPicParams: ^CUVIDPICPARAMS) -> cuda.CUresult ---
    cuvidDestroyDecoder :: proc (hDecoder: CUvideodecoder) -> cuda.CUresult ---
    cuvidGetDecodeStatus :: proc (hDecoder: CUvideodecoder, nPicIdx: c.int, pDecodeStatus: ^CUVIDGETDECODESTATUS) -> cuda.CUresult ---
    cuvidReconfigureDecoder :: proc (hDecoder: CUvideodecoder, pDecReconfigParams: ^CUVIDRECONFIGUREDECODERINFO) -> cuda.CUresult ---
    cuvidMapVideoFrame64 :: proc (hDecoder: CUvideodecoder,nPicIdx: c.int, DevPtr: ^cuda.CUdeviceptr, pPitch: ^c.uint, pVPP: ^CUVIDPROCPARAMS) -> cuda.CUresult ---
    cuvidUnmapVideoFrame64 :: proc (hDecoder: CUvideodecoder, DevPtr: cuda.CUdeviceptr) -> cuda.CUresult ---
    @(link_name="cuvidCreateVideoParser") _cuvidCreateVideoParser :: proc (pObj: ^CUvideoparser, pParams: ^CUVIDPARSERPARAMS(rawptr)) -> cuda.CUresult ---
    cuvidParseVideoData :: proc (pObj: CUvideoparser, pPacket: ^CUVIDSOURCEDATAPACKET) -> cuda.CUresult ---
    cuvidDestroyVideoParser :: proc (pObj: CUvideoparser) -> cuda.CUresult ---

    cuvidCtxLockCreate :: proc (pLock: ^CUvideoctxlock, ctx: cuda.CUcontext) -> cuda.CUresult ---
    cuvidCtxLockDestroy :: proc (lck: CUvideoctxlock) -> cuda.CUresult ---
    cuvidCtxLock :: proc ( lck: CUvideoctxlock, reserved_flags: c.uint) -> cuda.CUresult ---
    cuvidCtxUnlock :: proc ( lck: CUvideoctxlock, reserved_flags: c.uint) -> cuda.CUresult ---

    // 32 bit APIs
    //cuvidMapVideoFrame : proc "c" (hDecoder: CUvideodecoder,  nPicIdx: c.int, DevPtr: c.uint, pPitch: ^c.uint, pVPP: ^CUVIDPROCPARAMS) -> cuda.CUresult,
    //cuvidUnmapVideoFrame : proc "c" (hDecoder: CUvideodecoder, DevPtr: c.uint) -> cuda.CUresult,

    @(link_name="cuvidCreateVideoSource") _cuvidCreateVideoSource :: proc (pObj: ^CUvideosource, pszFileName: cstring, pParams: ^CUVIDSOURCEPARAMS(rawptr)) -> cuda.CUresult ---
    @(link_name="cuvidCreateVideoSourceW") _cuvidCreateVideoSourceW :: proc (pObj: ^CUvideosource, pwszFileName: [^]c.wchar_t, pParams: ^CUVIDSOURCEPARAMS(rawptr)) -> cuda.CUresult ---
    cuvidDestroyVideoSource :: proc (obj: CUvideosource) -> cuda.CUresult ---
    cuvidSetVideoSourceState :: proc (obj: CUvideosource, state: cudaVideoState) -> cuda.CUresult ---
    cuvidGetVideoSourceState :: proc (obj: CUvideosource) -> cudaVideoState ---
    cuvidGetSourceVideoFormat :: proc (obj: CUvideosource, pvidfmt: ^CUVIDEOFORMAT, flags: c.uint) -> cuda.CUresult ---
    cuvidGetSourceAudioFormat :: proc (obj: CUvideosource, paudfmt: ^CUAUDIOFORMAT, flags: c.uint) -> cuda.CUresult ---
}

cuvidCreateVideoParser :: proc(pObj: ^CUvideoparser, pParams: ^CUVIDPARSERPARAMS($T)) -> cuda.CUresult {
    return _cuvidCreateVideoParser(pObj, auto_cast pParams)
}
cuvidCreateVideoSource :: proc(pObj: ^CUvideosource, pszFileName: cstring, pParams: ^CUVIDSOURCEPARAMS($T)) -> cuda.CUresult {
    return _cuvidCreateVideoSource(pObj, pszFileName, auto_cast pParams)
}
cuvidCreateVideoSourceW :: proc(pObj: ^CUvideosource, pwszFileName: [^]c.wchar_t, pParams: ^CUVIDSOURCEPARAMS($T)) -> cuda.CUresult {
    return _cuvidCreateVideoSourceW(pObj, pszFileName, auto_cast pParams)
}

CUDA_WARM_START :: 0
CUDA_AUTOPOLL :: 1
CUDA_GET_6805_ADDR :: 2
CUDA_GET_TIME :: 3
CUDA_GET_PRAM :: 7
CUDA_SET_6805_ADDR :: 8
CUDA_SET_TIME :: 9
CUDA_POWERDOWN :: 0xa
CUDA_POWERUP_TIME :: 0xb
CUDA_SET_PRAM :: 0xc
CUDA_MS_RESET :: 0xd
CUDA_SEND_DFAC :: 0xe
CUDA_RESET_SYSTEM :: 0x11
CUDA_SET_IPL :: 0x12
CUDA_SET_AUTO_RATE :: 0x14
CUDA_GET_AUTO_RATE :: 0x16
CUDA_SET_DEVICE_LIST :: 0x19
CUDA_GET_DEVICE_LIST :: 0x1a
CUDA_GET_SET_IIC :: 0x22