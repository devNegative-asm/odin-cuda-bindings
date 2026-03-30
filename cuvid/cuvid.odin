package cuvid
import "../cuda"
import "core:c"

cudaVideoCodec :: enum(c.int) {
    MPEG1=0,
    MPEG2,
    MPEG4,
    VC1,
    H264,
    JPEG,
    H264_SVC,
    H264_MVC,
    HEVC,
    VP8,
    VP9,
    AV1,
    NumCodecs,
    // Uncompressed YUV
    YUV420 = (('I'<<24)|('Y'<<16)|('U'<<8)|('V')),
    YV12   = (('Y'<<24)|('V'<<16)|('1'<<8)|('2')),
    NV12   = (('N'<<24)|('V'<<16)|('1'<<8)|('2')),
    YUYV   = (('Y'<<24)|('U'<<16)|('Y'<<8)|('V')),
    UYVY   = (('U'<<24)|('Y'<<16)|('V'<<8)|('Y'))
}
cudaVideoChromaFormat :: enum(c.int) {
    Monochrome=0,
    YUV420,
    YUV422,
    YUV444
}
cudaVideoSurfaceFormat :: enum(c.int) {
    NV12=0,
    P016=1,
    YUV444=2,
    YUV444_16Bit=3,
    NV16=4,
    P216=5
}
cudaVideoDeinterlaceMode :: enum(c.int) {
    Weave=0,
    Bob,
    Adaptive
}

CUVIDDECODECAPS :: struct {
    eCodecType: cudaVideoCodec,
    eChromaFormat: cudaVideoChromaFormat,
    nBitDepthMinus8: c.uint,
    reserved1: [3]c.uint,
    bIsSupported: bool,
    nNumNVDECs: u8,
    nOutputFormatMask: bit_set[cudaVideoSurfaceFormat; c.ushort],
    nMaxWidth: c.uint,
    nMaxHeight: c.uint,
    nMaxMBCount: c.uint,
    nMinWidth: c.ushort,
    nMinHeight: c.ushort,
    bIsHistogramSupported: u8,
    nCounterBitDepth: u8,
    nMaxHistogramBins: c.ushort,
    reserved3: [10]c.uint,
}

cudaVideoCreateFlags :: enum(c.int) {
    //Default     = 0x00,
    PreferCUDA,
    PreferDXVA,
    PreferCUVID
}

CUVIDDECODECREATEINFO :: struct
{
    ulWidth: c.ulong,
    ulHeight: c.ulong,
    ulNumDecodeSurfaces: c.ulong,
    CodecType: cudaVideoCodec,
    ChromaFormat: cudaVideoChromaFormat,
    ulCreationFlags: bit_set[cudaVideoCreateFlags; c.ulong],
    bitDepthMinus8: c.ulong,
    ulIntraDecodeOnly: c.ulong,
    ulMaxWidth: c.ulong,
    ulMaxHeight: c.ulong,
    Reserved1: c.ulong,
    display_area: Short_Rect,
    OutputFormat: cudaVideoSurfaceFormat,
    DeinterlaceMode: cudaVideoDeinterlaceMode,
    ulTargetWidth: c.ulong,
    ulTargetHeight: c.ulong,
    ulNumOutputSurfaces: c.ulong,
    vidLock: CUvideoctxlock,
    target_rect: Short_Rect,
    enableHistogram: c.ulong,
    Reserved2: [4]c.ulong,
}

CUVIDH264DPBENTRY :: struct {
    PicIdx: c.int,
    FrameIdx: c.int,
    is_long_term: c.int,
    not_existing: c.int,
    used_for_reference: c.int,
    FieldOrderCnt: [2]c.int,
}

CUVIDH264MVCEXT :: struct {
    num_views_minus1: c.int,
    view_id: c.int,
    inter_view_flag: u8,
    num_inter_view_refs_l0: u8,
    num_inter_view_refs_l1: u8,
    MVCReserved8Bits: u8,
    InterViewRefsL0: [16]c.int,
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
    pNextLayer: ^CUVIDPICPARAMS,
    bRefBaseLayer: c.int,
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

CUVIDEOFORMAT_SIGNAL_DESCRIPTION_VIDEO_FORMAT :: enum(u8) {
    Component,
    Pal,
    NTSC,
    SECAM,
    MAC,
    Unspecified
}

CUAUDIOFORMAT :: struct {
    codec: cudaAudioCodec,
    channels: c.uint,
    samplespersec: c.uint,
    bitrate: c.uint,
    reserved1: c.uint,
    reserved2: c.uint,
}


cudaAudioCodec :: enum(c.int) {
    MPEG1=0,
    MPEG2,
    MP3,
    AC3,
    LPCM,
    AAC,
}

CUVIDEOFORMAT :: struct {
    codec: cudaVideoCodec,
    frame_rate : struct {
        numerator: c.uint,
        denominator: c.uint,
    },
    progressive_sequence: u8,
    bit_depth_luma_minus8: u8,
    bit_depth_chroma_minus8: u8,
    min_num_decode_surfaces: u8,
    coded_width: c.uint,
    coded_height: c.uint,
    display_area: struct {
        left: c.int,
        top: c.int,
        right: c.int,
        bottom: c.int,
    },
    chroma_format: cudaVideoChromaFormat,
    bitrate: c.uint,
    display_aspect_ratio: struct {
        x: c.int,
        y: c.int,
    },
    video_signal_description: struct {
        using packed : bit_field u8 {
            video_format          :CUVIDEOFORMAT_SIGNAL_DESCRIPTION_VIDEO_FORMAT | 3,
            video_full_range_flag :u8 | 1,
            reserved_zero_bits    :u8 | 4,
        },
        color_primaries: u8,
        transfer_characteristics: u8,
        matrix_coefficients: u8,
    },
    seqhdr_data_length: c.uint,
}

CUVIDAV1SEQHDR :: struct {
    max_width: c.uint,
    max_height: c.uint,
    reserved: [1016]u8,
} ;

CUVIDEOFORMATEX :: struct {
    format: CUVIDEOFORMAT,
    using header: struct #raw_union {
        av1: CUVIDAV1SEQHDR,
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

CUVIDPICPARAMS :: struct {
    PicWidthInMbs: c.int,
    FrameHeightInMbs: c.int,
    CurrPicIdx: c.int,
    field_pic_flag: c.int,
    bottom_field_flag: c.int,
    second_field: c.int,
    // Bitstream data
    nBitstreamDataLen: c.uint,
    pBitstreamData: ^u8,
    nNumSlices: c.uint,
    pSliceDataOffsets: ^c.uint,
    ref_pic_flag: c.int,
    intra_pic_flag: c.int,
    Reserved: [30]c.uint,
    // IN: Codec-specific data
    CodecSpecific: struct #raw_union {
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

CUVIDPARSERDISPINFO :: struct {
    picture_index: c.int,
    progressive_frame: c.int,
    top_field_first: c.int,
    repeat_first_field: c.int,
    timestamp: CUvideotimestamp,
}

CUVIDRECONFIGUREDECODERINFO :: struct {
    ulWidth: c.uint,
    ulHeight: c.uint,
    ulTargetWidth: c.uint,
    ulTargetHeight: c.uint,
    ulNumDecodeSurfaces: c.uint,
    reserved1: [12]c.uint,
    display_area : Short_Rect,
    target_rect: Short_Rect,
    reserved2: [11]c.uint,
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
    sei_message_type: u8,
    reserved: [3]u8,
    sei_message_size: c.uint,
} ;

CUVIDSEIMESSAGEINFO :: struct {
    pSEIData: rawptr,
    pSEIMessage: ^CUSEIMESSAGE,
    sei_message_count: c.uint,
    picIdx: c.uint,
} ;

CUVIDPARSERPARAMS :: struct($T: typeid) {
    CodecType: cudaVideoCodec,
    ulMaxNumDecodeSurfaces: c.uint,
    ulClockRate: c.uint,
    ulErrorThreshold: c.uint,
    ulMaxDisplayDelay: c.uint,
    using packed: bit_field c.uint {
        bAnnexb: c.uint | 1,
        bMemoryOptimize: c.uint | 1,
        uReserved: c.uint | 30,
    },
    uReserved1: [4]c.uint,
    pUserData: rawptr,
    pfnSequenceCallback: proc "c" (user_data: ^T, format_info: ^CUVIDEOFORMAT) -> c.int,
    pfnDecodePicture: proc "c" (user_data: ^T, decode_info: ^CUVIDPICPARAMS) -> c.int,
    pfnDisplayPicture: proc "c" (user_data: ^T, display_info: ^CUVIDPARSERDISPINFO) -> c.int,
    pfnGetOperatingPoint: proc "c" (user_data: ^T, point_info: ^CUVIDOPERATINGPOINTINFO) -> c.int,
    pfnGetSEIMsg: proc "c" (user_data: ^T, sei_info: ^CUVIDSEIMESSAGEINFO) -> c.int,
    pvReserved2: [5]rawptr,
    pExtVideoInfo: ^CUVIDEOFORMATEX,
}

CUvideopacketflag :: enum(c.int) {
    ENDOFSTREAM,
    TIMESTAMP,
    DISCONTINUITY,
    ENDOFPICTURE,
    NOTIFY_EOS,
}

CUVIDSOURCEDATAPACKET :: struct {
    flags: bit_set[CUvideopacketflag; c.ulong],
    payload_size: c.ulong,
    payload: [^]u8,
    timestamp: CUvideotimestamp
}

cuvidDecodeStatus :: enum(c.int)
{
    Invalid         = 0,
    InProgress      = 1,
    Success         = 2,
    Error           = 8,
    Error_Concealed = 9,
}
CUVIDGETDECODESTATUS :: struct {
    decodeStatus: cuvidDecodeStatus,
    reserved: [31]c.uint,
    pReserved: [8]rawptr,
}

CUVIDPROCPARAMS :: struct {
    progressive_frame: c.int,
    second_field: c.int,
    top_field_first: c.int,
    unpaired_field: c.int,
    reserved_flags: c.uint,
    reserved_zero: c.uint,
    raw_input_dptr: cuda.CUdeviceptr,
    raw_input_pitch: c.uint,
    raw_input_format: c.uint,
    raw_output_dptr: cuda.CUdeviceptr,
    raw_output_pitch: c.uint,
    Reserved1: c.uint,
    output_stream: cuda.CUstream,
    Reserved: [46]c.uint,
    histogram_dptr: ^cuda.CUdeviceptr,
    Reserved2: [1]rawptr,
}

CUVIDSOURCEPARAMS :: struct($T: typeid) {
    ulClockRate: c.uint,
    using packed : bit_field u32 {
        bAnnexb: u32 | 1,
        uReserved: u32 | 31,
    },
    uReserved1: [6]c.uint,
    pUserData: T,
    pfnVideoDataHandler:  proc(user_data: ^T, arg: CUVIDSOURCEDATAPACKET) -> int,
    pfnAudioDataHandler:  proc(user_data: ^T, arg: CUVIDSOURCEDATAPACKET) -> int,
    pvReserved2: [8]rawptr
}

CUvideodecoder :: distinct rawptr

CUvideoctxlock :: distinct rawptr
CUvideoparser :: distinct rawptr
CUvideosource :: distinct rawptr
CUvideotimestamp :: i64

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
    Error   = -1,
    Stopped = 0,
    Started = 1
}

when (ODIN_OS == .Windows) {
    foreign import lib "system:libnvcuvid.lib"
} else {
    foreign import lib "system:libnvcuvid.so"
}

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