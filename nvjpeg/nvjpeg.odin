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
    UNCHANGED   = 0,
    YUV         = 1,
    Y           = 2,
    RGB         = 3,
    BGR         = 4,
    RGBI        = 5,
    BGRI        = 6,
    FORMAT_MAX  = 6
}

nvjpegInputFormat :: enum(c.int) {
    RGB         = 3,
    BGR         = 4,
    RGBI        = 5,
    BGRI        = 6
}

nvjpegBackend :: enum (c.int) {
    DEFAULT = 0,
    HYBRID  = 1,
    GPU_HYBRID = 2,
    HARDWARE = 3
}

nvjpegJpegEncoding :: enum(c.int) {
    UNKNOWN                                 = 0x0,
    BASELINE_DCT                            = 0xc0,
    EXTENDED_SEQUENTIAL_DCT_HUFFMAN         = 0xc1,
    PROGRESSIVE_DCT_HUFFMAN                 = 0xc2
}

nvjpegScaleFactor :: enum(c.int) {
    NVJPEG_SCALE_NONE = 0,
    NVJPEG_SCALE_1_BY_2 = 1,
    NVJPEG_SCALE_1_BY_4 = 2,
    NVJPEG_SCALE_1_BY_8 = 3,
}
NVJPEG_MAX_COMPONENT :: 4

NVJPEG_FLAGS_DEFAULT :: 0
NVJPEG_FLAGS_HW_DECODE_NO_PIPELINE :: 1
NVJPEG_FLAGS_ENABLE_MEMORY_POOLS :: 1<<1
NVJPEG_FLAGS_BITSTREAM_STRICT :: 1<<2

tDevMalloc :: proc "c" (ptr: ^cuda.CUdeviceptr, size: c.size_t) -> cuda.CUresult;
tDevFree :: proc "c" (ptr: cuda.CUdeviceptr) -> cuda.CUresult;
tPinnedMalloc :: proc "c" (ptr: ^cuda.CUdeviceptr, size: c.size_t, flags: c.uint) -> cuda.CUresult;
tPinnedFree :: proc "c" (ptr: cuda.CUdeviceptr) -> cuda.CUresult;

nvjpegImage :: struct {
    channel: [NVJPEG_MAX_COMPONENT]^u8,
    pitch: [NVJPEG_MAX_COMPONENT]c.size_t
}

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

when (ODIN_OS == .Windows) {
    foreign import lib "system:libnvjpeg.lib"
} else {
    foreign import lib "system:libnvjpeg.so"
}


@(default_calling_convention = "stdcall" when (ODIN_OS == .Windows) else "c")
foreign lib {
    nvjpegCreateSimple:: proc(handle: ^nvjpegHandle) -> nvjpegStatus ---
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
    nvjpegJpegStateCreate :: proc(handle: nvjpegHandle, jpeg_handle: ^nvjpegJpegState) -> nvjpegStatus ---
    nvjpegJpegStateDestroy :: proc(jpeg_handle: nvjpegJpegState) -> nvjpegStatus ---
    nvjpegGetImageInfo :: proc(handle: nvjpegHandle, data: [^]u8, length: c.size_t, nComponents: ^c.int, subsampling: ^nvjpegChromaSubsampling, widths: ^[NVJPEG_MAX_COMPONENT]c.int, heights: ^[NVJPEG_MAX_COMPONENT]c.int) -> nvjpegStatus ---
    nvjpegDecode :: proc(handle: nvjpegHandle, jpeg_handle: nvjpegJpegState, data: [^]u8, length: c.size_t,  output_format: nvjpegOutputFormat, destination: ^nvjpegImage, stream: cuda.CUstream) -> nvjpegStatus ---
    nvjpegDecodeBatchedInitialize :: proc(handle: nvjpegHandle, jpeg_handle: nvjpegJpegState, batch_size: c.int, max_cpu_threads: c.int, output_format: nvjpegOutputFormat) -> nvjpegStatus ---
    nvjpegDecodeBatched :: proc(handle: nvjpegHandle, jpeg_handle: nvjpegJpegState, data: [^][^]u8, lengths: [^]c.size_t,  destinations: [^]nvjpegImage, stream: cuda.CUstream) -> nvjpegStatus ---
    nvjpegDecodeBatchedPreAllocate :: proc(handle: nvjpegHandle, jpeg_handle: nvjpegJpegState, batch_size: c.int, width: c.int, height: c.int, chroma_subsampling: nvjpegChromaSubsampling, output_format: nvjpegOutputFormat) -> nvjpegStatus ---
}
