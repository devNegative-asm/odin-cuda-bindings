package nvjpeg
import "core:c"
import "../cuda"

nvjpegStatus :: enum(c.int) {
    SUCCESS                       = 0,
    NOT_INITIALIZED               = 1,
    INVALID_PARAMETER             = 2,
    BAD_JPEG                      = 3,
    JPEG_NOT_SUPPORTED            = 4,
    ALLOCATOR_FAILURE             = 5,
    EXECUTION_FAILED              = 6,
    ARCH_MISMATCH                 = 7,
    INTERNAL_ERROR                = 8,
    IMPLEMENTATION_NOT_SUPPORTED  = 9,
};

nvjpegChromaSubsampling :: enum(c.int) {
    CSS_444 = 0,
    CSS_422 = 1,
    CSS_420 = 2,
    CSS_440 = 3,
    CSS_411 = 4,
    CSS_410 = 5,
    CSS_GRAY = 6,
    CSS_410V = 7,
    CSS_UNKNOWN = -1
}

nvjpegOutputFormat :: enum(c.int) {
    /** return decompressed image as it is - write planar output */
    UNCHANGED   = 0,
    /** return planar luma and chroma, assuming YCbCr colorspace */
    YUV         = 1,
    /** return luma component only, if YCbCr colorspace, or try to convert to grayscale, writes to 1-st channel of nvjpegImage_t */
    Y           = 2,
    /** convert to planar RGB */
    RGB         = 3,
    /** convert to planar BGR */
    BGR         = 4,
    /** convert to interleaved RGB and write to 1-st channel of nvjpegImage_t */
    RGBI        = 5,
    /** convert to interleaved BGR and write to 1-st channel of nvjpegImage_t */
    BGRI        = 6,
    /** maximum allowed value */
    FORMAT_MAX  = 6
}

/** Parameter of this type specifies what type of input user provides for encoding */
nvjpegInputFormat :: enum(c.int) {
    /** Input is RGB - will be converted to YCbCr before encoding */
    RGB         = 3,
    /** Input is RGB - will be converted to YCbCr before encoding */
    BGR         = 4,
    /** Input is interleaved RGB - will be converted to YCbCr before encoding */
    RGBI        = 5,
    /** Input is interleaved RGB - will be converted to YCbCr before encoding */
    BGRI        = 6
}

nvjpegBackend :: enum (c.int) {
    DEFAULT = 0,
    /** uses CPU for Huffman decode */
    HYBRID  = 1,
    /** uses GPU assisted Huffman decode. nvjpegDecodeBatched will use GPU decoding for baseline JPEG bitstreams with interleaved scan when batch size is bigger than 100 */
    GPU_HYBRID = 2,
    /** supports baseline JPEG bitstream with single scan. 410 and 411 sub-samplings are not supported */
    HARDWARE = 3
}

/** Currently parseable JPEG encodings (SOF markers) */
nvjpegJpegEncoding :: enum(c.int) {
    UNKNOWN                                 = 0x0,
    BASELINE_DCT                            = 0xc0,
    EXTENDED_SEQUENTIAL_DCT_HUFFMAN         = 0xc1,
    PROGRESSIVE_DCT_HUFFMAN                 = 0xc2
}

nvjpegScaleFactor :: enum(c.int) {
    /** decoded output is not scaled  */
    NVJPEG_SCALE_NONE = 0,
    /** decoded output width and height is scaled by a factor of 1/2 */
    NVJPEG_SCALE_1_BY_2 = 1,
    /** decoded output width and height is scaled by a factor of 1/4 */
    NVJPEG_SCALE_1_BY_4 = 2,
    /** decoded output width and height is scaled by a factor of 1/8 */
    NVJPEG_SCALE_1_BY_8 = 3,
}
NVJPEG_MAX_COMPONENT :: 4

NVJPEG_FLAGS_DEFAULT :: 0
NVJPEG_FLAGS_HW_DECODE_NO_PIPELINE :: 1
NVJPEG_FLAGS_ENABLE_MEMORY_POOLS :: 1<<1
NVJPEG_FLAGS_BITSTREAM_STRICT :: 1<<2

/** Prototype for device memory allocation, modelled after cudaMalloc() */
tDevMalloc :: proc "c" (ptr: ^cuda.CUdeviceptr, size: c.size_t) -> cuda.CUresult;
/** Prototype for device memory release */
tDevFree :: proc "c" (ptr: cuda.CUdeviceptr) -> cuda.CUresult;
/** Prototype for pinned memory allocation, modelled after cudaHostAlloc() */
tPinnedMalloc :: proc "c" (ptr: ^cuda.CUdeviceptr, size: c.size_t, flags: c.uint) -> cuda.CUresult;
/** Prototype for device memory release */
tPinnedFree :: proc "c" (ptr: cuda.CUdeviceptr) -> cuda.CUresult;

nvjpegImage :: struct {
    channel: [NVJPEG_MAX_COMPONENT]^u8,
    pitch: [NVJPEG_MAX_COMPONENT]c.size_t
}

/** Memory allocator using mentioned prototypes, provided to nvjpegCreateEx. This allocator will be used for all device memory allocations inside the library */
nvjpegDevAllocator :: struct {
    dev_malloc: tDevMalloc,
    dev_free: tDevFree,
}

nvjpegPinnedAllocator :: struct {
    pinned_malloc: tPinnedMalloc,
    pinned_free: tPinnedFree,
}

nvjpegHandle :: distinct rawptr
nvjpegJpegState :: distinct rawptr
nvjpegEncoderState :: distinct rawptr
nvjpegEncoderParams :: distinct rawptr
nvjpegJpegStream :: distinct rawptr

Dims :: struct($T: typeid) {
    width: T,
    height: T,
}
Longlong_Dims :: Dims(c.longlong)
Long_Dims :: Dims(c.long)
Int_Dims :: Dims(c.int)
Short_Dims :: Dims(c.short)

jpeg_encode_simple :: proc(nv_handle:nvjpegHandle, rgb_data: cuda.CUdeviceptr, rgb_data_pitch: uint, box:Int_Dims, create_stream:=true, existing_stream:cuda.CUstream=nil, allocator:=context.allocator) -> []u8 {
    nv_enc_state: nvjpegEncoderState
    nv_enc_params: nvjpegEncoderParams
    stream: cuda.CUstream
    if(create_stream) {
        cuda.cuStreamCreate(&stream, .NON_BLOCKING)
    } else {
        stream = existing_stream
    }
    nv_image: nvjpegImage = {
        channel = {auto_cast rgb_data, nil, nil, nil},
        pitch = {rgb_data_pitch, 0, 0, 0}
    }
    
    nvjpegEncoderStateCreate(nv_handle, &nv_enc_state, stream)
    nvjpegEncoderParamsCreate(nv_handle, &nv_enc_params, stream)
    defer {
        nvjpegEncoderParamsDestroy(nv_enc_params)
        nvjpegEncoderStateDestroy(nv_enc_state)
    }

    nvjpegEncoderParamsSetQuality(nv_enc_params, 90, stream)
    nvjpegEncoderParamsSetEncoding(nv_enc_params, .BASELINE_DCT, stream)
    nvjpegEncoderParamsSetOptimizedHuffman(nv_enc_params, 0, stream)
    nvjpegEncoderParamsSetSamplingFactors(nv_enc_params, .CSS_444, stream)
    nvjpegEncodeImage(nv_handle, nv_enc_state, nv_enc_params, &nv_image, .RGBI, box.width, box.height, stream)
    length: uint
    nvjpegEncodeRetrieveBitstream(nv_handle, nv_enc_state, nil, &length, stream)
    compressed := make([]u8, length, allocator)
    cuda.cuStreamSynchronize(stream)
    nvjpegEncodeRetrieveBitstream(nv_handle, nv_enc_state, raw_data(compressed), &length, stream)
    cuda.cuStreamSynchronize(stream)
    if(create_stream) {
        cuda.cuStreamDestroy(stream)
    }
    return compressed
}

import "core:fmt"
nvjpeg_safe :: proc(x: nvjpegStatus, exp:=#caller_expression, loc:=#caller_location) -> nvjpegStatus {
    assert(x == nvjpegStatus.SUCCESS, fmt.tprintfln("%v @ %s", x, exp), loc)
    return x
}

jpeg_decode_simple :: proc(nv_handle:nvjpegHandle, data: []u8, outputFormat: nvjpegOutputFormat = .BGRI, stream:cuda.CUstream=nil, allocator:=context.allocator) -> ([]u8, i32, i32) {
    state: nvjpegJpegState
    nComponents: c.int
    subsampling: nvjpegChromaSubsampling
    widths: [NVJPEG_MAX_COMPONENT]c.int
    heights: [NVJPEG_MAX_COMPONENT]c.int
    nvjpeg_safe(nvjpegJpegStateCreate(nv_handle, &state))
    nvjpeg_safe(nvjpegGetImageInfo(nv_handle, raw_data(data), len(data), &nComponents, &subsampling, &widths, &heights)) // I think widths and heights are for the Y,U,and V planes. Since Y is never subsampled, we can use that for the actual image size.
    result_slice : []u8
    result_pitch : c.int
    img: nvjpegImage
    #partial switch outputFormat {
        case .RGBI:
            fallthrough
        case .BGRI:
            result_slice = make([]u8, 3 * widths[0] * heights[0], allocator)
            img.channel[0] = raw_data(result_slice)
            img.pitch[0] = auto_cast (3 * widths[0])
        case:
            //unsupported
            return nil, 0, 0
    }
    if result_slice == nil {
        panic("nil when allocated")
    }
    nvjpeg_safe(nvjpegDecode(handle=nv_handle, jpeg_handle=state, data=raw_data(data), length=len(data),  output_format=outputFormat, destination=&img, stream=stream))

    return result_slice, widths[0], heights[0]
}

foreign import lib "system:libnvjpeg.so"
@(default_calling_convention = "stdcall" when (ODIN_OS == .Windows) else "c")
foreign lib {
    //nvjpegCreate:: proc(backend: nvjpegBackend, dev_allocator: ^nvjpegDevAllocator, handle: ^nvjpegHandle) -> nvjpegStatus ---
    /** Initalization of nvjpeg handle with default backend and default memory allocators. INT/OUT handle: Codec instance, use for other calls */
    nvjpegCreateSimple:: proc(handle: ^nvjpegHandle) -> nvjpegStatus ---
    /** Initalization of nvjpeg handle with additional parameters. This handle is used for all consecutive nvjpeg calls
    * IN         backend       : Backend to use. Currently Default or Hybrid (which is the same at the moment) is supported.
    * IN         dev_allocator : Pointer to nvjpegDevAllocator. If NULL - use default cuda calls (cudaMalloc/cudaFree)
    * IN         pinned_allocator : Pointer to nvjpegPinnedAllocator. If NULL - use default cuda calls (cudaHostAlloc/cudaFreeHost)
    * IN         flags         : Parameters for the operation. Must be 0.
    * INT/OUT    handle        : Codec instance, use for other calls */
    nvjpegCreateEx :: proc(backend: nvjpegBackend, dev_allocator: ^nvjpegDevAllocator, pinned_allocator: ^nvjpegPinnedAllocator, flags: c.uint, handle: ^nvjpegHandle) -> nvjpegStatus ---
    nvjpegDestroy :: proc(handle: nvjpegHandle) -> nvjpegStatus ---
    nvjpegEncoderStateCreate :: proc(handle: nvjpegHandle, encoder_state: ^nvjpegEncoderState, stream: cuda.CUstream) -> nvjpegStatus ---
    nvjpegEncoderStateDestroy :: proc(encoder_state: nvjpegEncoderState) -> nvjpegStatus ---
    nvjpegEncoderParamsCreate :: proc(handle: nvjpegHandle, encoder_params: ^nvjpegEncoderParams, stream: cuda.CUstream) -> nvjpegStatus ---
    nvjpegEncoderParamsDestroy :: proc(encoder_params: nvjpegEncoderParams) -> nvjpegStatus ---
    nvjpegEncoderParamsSetQuality :: proc( encoder_params: nvjpegEncoderParams, quality: c.int , stream: cuda.CUstream) -> nvjpegStatus ---
    nvjpegEncoderParamsSetEncoding :: proc( encoder_params: nvjpegEncoderParams, etype: nvjpegJpegEncoding, stream: cuda.CUstream) -> nvjpegStatus ---
    nvjpegEncoderParamsSetOptimizedHuffman :: proc( encoder_params: nvjpegEncoderParams, optimized: c.int, stream: cuda.CUstream) -> nvjpegStatus ---
    nvjpegEncoderParamsSetSamplingFactors :: proc( encoder_params: nvjpegEncoderParams, chroma_subsampling: nvjpegChromaSubsampling, stream: cuda.CUstream) -> nvjpegStatus ---
    nvjpegEncodeGetBufferSize :: proc(handle: nvjpegHandle,  params: nvjpegEncoderParams, image_width, image_height: c.int, max_stream_length:^c.size_t) -> nvjpegStatus ---
    nvjpegEncodeYUV :: proc(handle: nvjpegHandle, encoder_state: nvjpegEncoderState,  params: nvjpegEncoderParams, source: ^nvjpegImage, chroma_subsampling: nvjpegChromaSubsampling, image_width, image_height: c.int, stream: cuda.CUstream) -> nvjpegStatus ---
    nvjpegEncodeImage :: proc(handle: nvjpegHandle, encoder_state: nvjpegEncoderState,  params: nvjpegEncoderParams, source: ^nvjpegImage, input_format: nvjpegInputFormat, image_width, image_height: c.int, stream: cuda.CUstream) -> nvjpegStatus ---
    nvjpegEncodeRetrieveBitstreamDevice :: proc(handle: nvjpegHandle, encoder_state: nvjpegEncoderState, data: [^]u8, length: ^c.size_t, stream: cuda.CUstream) -> nvjpegStatus ---
    nvjpegEncodeRetrieveBitstream :: proc(handle: nvjpegHandle, encoder_state: nvjpegEncoderState, data: [^]u8, length: ^c.size_t, stream: cuda.CUstream) -> nvjpegStatus ---
    // Initalization of decoding state
    // IN         handle        : Library handle
    // INT/OUT    jpeg_handle   : Decoded jpeg image state handle
    nvjpegJpegStateCreate :: proc(handle: nvjpegHandle, jpeg_handle: ^nvjpegJpegState) -> nvjpegStatus ---
    // Release the jpeg image handle.
    // INT/OUT    jpeg_handle   : Decoded jpeg image state handle
    nvjpegJpegStateDestroy :: proc(jpeg_handle: nvjpegJpegState) -> nvjpegStatus ---
    // Retrieve the image info, including channel, width and height of each component, and chroma subsampling.
    // If less than NVJPEG_MAX_COMPONENT channels are encoded, then zeros would be set to absent channels information
    // If the image is 3-channel, all three groups are valid.
    // This function is thread safe.
    // IN         handle      : Library handle
    // IN         data        : Pointer to the buffer containing the jpeg stream data to be decoded. 
    // IN         length      : Length of the jpeg image buffer.
    // OUT        nComponent  : Number of componenets of the image, currently only supports 1-channel (grayscale) or 3-channel.
    // OUT        subsampling : Chroma subsampling used in this JPEG, see nvjpegChromaSubsampling_t
    // OUT        widths      : pointer to NVJPEG_MAX_COMPONENT of ints, returns width of each channel. 0 if channel is not encoded  
    // OUT        heights     : pointer to NVJPEG_MAX_COMPONENT of ints, returns height of each channel. 0 if channel is not encoded 
    nvjpegGetImageInfo :: proc(handle: nvjpegHandle, data: [^]u8, length: c.size_t, nComponents: ^c.int, subsampling: ^nvjpegChromaSubsampling, widths: ^[NVJPEG_MAX_COMPONENT]c.int, heights: ^[NVJPEG_MAX_COMPONENT]c.int) -> nvjpegStatus ---
    // Decodes single image. The API is back-end agnostic. It will decide on which implementation to use internally
    // Destination buffers should be large enough to be able to store  output of specified format.
    // For each color plane sizes could be retrieved for image using nvjpegGetImageInfo()
    // and minimum required memory buffer for each plane is nPlaneHeight*nPlanePitch where nPlanePitch >= nPlaneWidth for
    // planar output formats and nPlanePitch >= nPlaneWidth*nOutputComponents for interleaved output format.
    // 
    // IN/OUT     handle        : Library handle
    // INT/OUT    jpeg_handle   : Decoded jpeg image state handle
    // IN         data          : Pointer to the buffer containing the jpeg image to be decoded. 
    // IN         length        : Length of the jpeg image buffer.
    // IN         output_format : Output data format. See nvjpegOutputFormat_t for description
    // IN/OUT     destination   : Pointer to structure with information about output buffers. See nvjpegImage_t description.
    // IN/OUT     stream        : CUDA stream where to submit all GPU work
    // 
    // \return NVJPEG_STATUS_SUCCESS if successful
    nvjpegDecode :: proc(handle: nvjpegHandle, jpeg_handle: nvjpegJpegState, data: [^]u8, length: c.size_t,  output_format: nvjpegOutputFormat, destination: ^nvjpegImage, stream: cuda.CUstream) -> nvjpegStatus ---
    //////////////////////////////////////////////
    /////////////// Batch decoding ///////////////
    //////////////////////////////////////////////
    // Resets and initizlizes batch decoder for working on the batches of specified size
    // Should be called once for decoding bathes of this specific size, also use to reset failed batches
    // IN/OUT     handle          : Library handle
    // INT/OUT    jpeg_handle     : Decoded jpeg image state handle
    // IN         batch_size      : Size of the batch
    // IN         max_cpu_threads : Maximum number of CPU threads that will be processing this batch
    // IN         output_format   : Output data format. Will be the same for every image in batch
    //
    // \return NVJPEG_STATUS_SUCCESS if successful
    nvjpegDecodeBatchedInitialize :: proc(handle: nvjpegHandle, jpeg_handle: nvjpegJpegState, batch_size: c.int, max_cpu_threads: c.int, output_format: nvjpegOutputFormat) -> nvjpegStatus ---
    // Decodes batch of images. Output buffers should be large enough to be able to store 
    // outputs of specified format, see single image decoding description for details. Call to 
    // nvjpegDecodeBatchedInitialize() is required prior to this call, batch size is expected to be the same as 
    // parameter to this batch initialization function.
    // 
    // IN/OUT     handle        : Library handle
    // INT/OUT    jpeg_handle   : Decoded jpeg image state handle
    // IN         data          : Array of size batch_size of pointers to the input buffers containing the jpeg images to be decoded. 
    // IN         lengths       : Array of size batch_size with lengths of the jpeg images' buffers in the batch.
    // IN/OUT     destinations  : Array of size batch_size with pointers to structure with information about output buffers, 
    // IN/OUT     stream        : CUDA stream where to submit all GPU work
    // 
    // \return NVJPEG_STATUS_SUCCESS if successful
    nvjpegDecodeBatched :: proc(handle: nvjpegHandle, jpeg_handle: nvjpegJpegState, data: [^][^]u8, lengths: [^]c.size_t,  destinations: [^]nvjpegImage, stream: cuda.CUstream) -> nvjpegStatus ---
    // Allocates the internal buffers as a pre-allocation step
    // IN    handle          : Library handle
    // IN    jpeg_handle     : Decoded jpeg image state handle
    // IN    width   : frame width
    // IN    height  : frame height
    // IN    chroma_subsampling   : chroma subsampling of images to be decoded
    // IN    output_format : out format
    nvjpegDecodeBatchedPreAllocate :: proc(handle: nvjpegHandle, jpeg_handle: nvjpegJpegState, batch_size: c.int, width: c.int, height: c.int, chroma_subsampling: nvjpegChromaSubsampling, output_format: nvjpegOutputFormat) -> nvjpegStatus ---
}
