package nppicc

//Generated with the help of odin-c-bindgen
import "../cuda"
import "core:c"

_ :: c

// Workaround for cuda_fp16.h C incompatibility
Npp16f :: struct {
    fp16: c.short,
}

Npp16f_2 :: struct {
    fp16_0: c.short,
    fp16_1: c.short,
}

// NPP_ALIGN_8     :: _attribute__((aligned(8)))
// NPP_ALIGN_16    :: _attribute__((aligned(16)))

NppiInterpolationMode :: enum c.int {
    INTER_UNDEFINED = 0,
    INTER_NN = 1,
    INTER_LINEAR = 2,
    INTER_CUBIC = 4,
    INTER_CUBIC2P_BSPLINE,
    INTER_CUBIC2P_CATMULLROM,
    INTER_CUBIC2P_B05C03,
    INTER_SUPER = 8,
    INTER_LANCZOS = 16,
    INTER_LANCZOS3_ADVANCED = 17,
    SMOOTH_EDGE = 0x8000000,
}

NppiBayerGridPosition :: enum c.int {
    BGGR = 0,
    RGGB = 1,
    GBRG = 2,
    GRBG = 3,
}

NppiMaskSize :: enum c.int {
    _1_X_3,
    _1_X_5,
    _3_X_1 = 100, // leaving space for more 1 X N type enum values 
    _5_X_1,
    _3_X_3 = 200, // leaving space for more N X 1 type enum values
    _5_X_5,
    _7_X_7 = 400,
    _9_X_9 = 500,
    _11_X_11 = 600,
    _13_X_13 = 700,
    _15_X_15 = 800,
}

NppiDifferentialKernel :: enum c.int {
    OBEL,
    CHARR,
}

NppStatus :: enum c.int {
    /* negative return-codes indicate errors */
    NOT_SUPPORTED_MODE_ERROR = -9999,

    /* negative return-codes indicate errors */
    INVALID_HOST_POINTER_ERROR = -1032,

    /* negative return-codes indicate errors */
    INVALID_DEVICE_POINTER_ERROR = -1031,

    /* negative return-codes indicate errors */
    LUT_PALETTE_BITSIZE_ERROR = -1030,

    /* negative return-codes indicate errors */
    ZC_MODE_NOT_SUPPORTED_ERROR = -1028,

    /* negative return-codes indicate errors */
    NOT_SUFFICIENT_COMPUTE_CAPABILITY = -1027,

    /* negative return-codes indicate errors */
    TEXTURE_BIND_ERROR = -1024,

    /* negative return-codes indicate errors */
    WRONG_INTERSECTION_ROI_ERROR = -1020,

    /* negative return-codes indicate errors */
    HAAR_CLASSIFIER_PIXEL_MATCH_ERROR = -1006,

    /* negative return-codes indicate errors */
    MEMFREE_ERROR = -1005,

    /* negative return-codes indicate errors */
    MEMSET_ERROR = -1004,

    /* negative return-codes indicate errors */
    MEMCPY_ERROR = -1003,

    /* negative return-codes indicate errors */
    ALIGNMENT_ERROR = -1002,

    /* negative return-codes indicate errors */
    CUDA_KERNEL_EXECUTION_ERROR = -1000,

    /* negative return-codes indicate errors */
    ROUND_MODE_NOT_SUPPORTED_ERROR = -213,

    /* negative return-codes indicate errors */
    QUALITY_INDEX_ERROR = -210,

    /* negative return-codes indicate errors */
    RESIZE_NO_OPERATION_ERROR = -201,

    /* negative return-codes indicate errors */
    OVERFLOW_ERROR = -109,

    /* negative return-codes indicate errors */
    NOT_EVEN_STEP_ERROR = -108,

    /* negative return-codes indicate errors */
    HISTOGRAM_NUMBER_OF_LEVELS_ERROR = -107,

    /* negative return-codes indicate errors */
    LUT_NUMBER_OF_LEVELS_ERROR = -106,

    /* negative return-codes indicate errors */
    CORRUPTED_DATA_ERROR = -61,

    /* negative return-codes indicate errors */
    CHANNEL_ORDER_ERROR = -60,

    /* negative return-codes indicate errors */
    ZERO_MASK_VALUE_ERROR = -59,

    /* negative return-codes indicate errors */
    QUADRANGLE_ERROR = -58,

    /* negative return-codes indicate errors */
    RECTANGLE_ERROR = -57,

    /* negative return-codes indicate errors */
    COEFFICIENT_ERROR = -56,

    /* negative return-codes indicate errors */
    NUMBER_OF_CHANNELS_ERROR = -53,

    /* negative return-codes indicate errors */
    COI_ERROR = -52,

    /* negative return-codes indicate errors */
    DIVISOR_ERROR = -51,

    /* negative return-codes indicate errors */
    CHANNEL_ERROR = -47,

    /* negative return-codes indicate errors */
    STRIDE_ERROR = -37,

    /* negative return-codes indicate errors */
    ANCHOR_ERROR = -34,

    /* negative return-codes indicate errors */
    MASK_SIZE_ERROR = -33,

    /* negative return-codes indicate errors */
    RESIZE_FACTOR_ERROR = -23,

    /* negative return-codes indicate errors */
    INTERPOLATION_ERROR = -22,

    /* negative return-codes indicate errors */
    MIRROR_FLIP_ERROR = -21,

    /* negative return-codes indicate errors */
    MOMENT_00_ZERO_ERROR = -20,

    /* negative return-codes indicate errors */
    THRESHOLD_NEGATIVE_LEVEL_ERROR = -19,

    /* negative return-codes indicate errors */
    THRESHOLD_ERROR = -18,

    /* negative return-codes indicate errors */
    CONTEXT_MATCH_ERROR = -17,

    /* negative return-codes indicate errors */
    FFT_FLAG_ERROR = -16,

    /* negative return-codes indicate errors */
    FFT_ORDER_ERROR = -15,

    /* negative return-codes indicate errors */
    STEP_ERROR = -14,

    /* negative return-codes indicate errors */
    SCALE_RANGE_ERROR = -13,

    /* negative return-codes indicate errors */
    DATA_TYPE_ERROR = -12,

    /* negative return-codes indicate errors */
    OUT_OFF_RANGE_ERROR = -11,

    /* negative return-codes indicate errors */
    DIVIDE_BY_ZERO_ERROR = -10,

    /* negative return-codes indicate errors */
    MEMORY_ALLOCATION_ERR = -9,

    /* negative return-codes indicate errors */
    NULL_POINTER_ERROR = -8,

    /* negative return-codes indicate errors */
    RANGE_ERROR = -7,

    /* negative return-codes indicate errors */
    SIZE_ERROR = -6,

    /* negative return-codes indicate errors */
    BAD_ARGUMENT_ERROR = -5,

    /* negative return-codes indicate errors */
    NO_MEMORY_ERROR = -4,

    /* negative return-codes indicate errors */
    NOT_IMPLEMENTED_ERROR = -3,

    /* negative return-codes indicate errors */
    ERROR = -2,

    /* negative return-codes indicate errors */
    ERROR_RESERVED = -1,

    /* success */
    NO_ERROR = 0,

    /* success */
    SUCCESS = 0,

    /* positive return-codes indicate warnings */
    NO_OPERATION_WARNING = 1,

    /* positive return-codes indicate warnings */
    DIVIDE_BY_ZERO_WARNING = 6,

    /* positive return-codes indicate warnings */
    AFFINE_QUAD_INCORRECT_WARNING = 28,

    /* positive return-codes indicate warnings */
    WRONG_INTERSECTION_ROI_WARNING = 29,

    /* positive return-codes indicate warnings */
    WRONG_INTERSECTION_QUAD_WARNING = 30,

    /* positive return-codes indicate warnings */
    DOUBLE_SIZE_WARNING = 35,

    /* positive return-codes indicate warnings */
    MISALIGNED_DST_ROI_WARNING = 10000,
}

NppLibraryVersion :: struct {
    major: c.int,
    minor: c.int,
    build: c.int,
}

Npp8u :: c.uchar

Npp8s :: c.schar

Npp16u :: c.ushort

Npp16s :: c.short

Npp32u :: c.uint

Npp32s :: c.int

Npp64u :: c.ulonglong

Npp64s :: c.longlong

Npp32f :: f32

Npp64f :: f64

Npp8uc :: struct {
    re: Npp8u,
    im: Npp8u,
}

Npp16uc :: struct {
    re: Npp16u,
    im: Npp16u,
}

Npp16sc :: struct {
    re: Npp16s,
    im: Npp16s,
}

Npp32uc :: struct {
    re: Npp32u,
    im: Npp32u,
}

Npp32sc :: struct {
    re: Npp32s,
    im: Npp32s,
}

Npp32fc :: struct {
    re: Npp32f,
    im: Npp32f,
}

Npp64sc :: struct {
    re: Npp64s,
    im: Npp64s,
}

Npp64fc :: struct {
    re: Npp64f,
    im: Npp64f,
}

NPP_MIN_8U      :: 0
NPP_MAX_8U      :: 255
NPP_MIN_16U     :: 0
NPP_MAX_16U     :: 65535
NPP_MIN_32U     :: 0
NPP_MAX_32U     :: 4294967295
NPP_MIN_64U     :: 0
NPP_MAX_64U     :: 18446744073709551615
NPP_MIN_8S      :: -127 - 1
NPP_MAX_8S      :: 127
NPP_MIN_16S     :: -32767 - 1
NPP_MAX_16S     :: 32767
NPP_MIN_32S     :: -2147483647 - 1
NPP_MAX_32S     :: 2147483647
NPP_MAX_64S     :: 9223372036854775807
NPP_MIN_64S     :: -9223372036854775807 - 1
NPP_MINABS_32F  :: 1.175494351-38
NPP_MAXABS_32F  :: 3.402823466+38
NPP_MINABS_64F  :: 2.2250738585072014-308
NPP_MAXABS_64F  :: 1.7976931348623158+308

NppiPoint :: struct {
    x: c.int,
    y: c.int,
}

NppiPoint32f :: struct {
    x: Npp32f,
    y: Npp32f,
}

NppiPoint64f :: struct {
    x: Npp64f,
    y: Npp64f,
}

NppPointPolar :: struct {
    rho:   Npp32f,
    theta: Npp32f,
}

NppiSize :: struct {
    width:  c.int,
    height: c.int,
}

NppiRect :: struct {
    x:      c.int,
    y:      c.int,
    width:  c.int,
    height: c.int,
}

NppiAxis :: enum c.int {
    HORIZONTAL_AXIS,
    VERTICAL_AXIS,
    BOTH_AXIS,
}

NppCmpOp :: enum c.int {
    LESS,
    LESS_EQ,
    EQ,
    GREATER_EQ,
    GREATER,
}

NppRoundMode :: enum c.int {
    ND_NEAR,
    OUND_NEAREST_TIES_TO_EVEN = 0,
    ND_FINANCIAL,
    OUND_NEAREST_TIES_AWAY_FROM_ZERO = 1,
    ND_ZERO,
    OUND_TOWARD_ZERO = 2,
}

NppiBorderType :: enum c.int {
    UNDEFINED = 0,
    NONE      = 0,
    CONSTANT  = 1,
    REPLICATE = 2,
    WRAP      = 3,
    MIRROR    = 4,
}

NppHintAlgorithm :: enum c.int {
    NONE,
    FAST,
    ACCURATE,
}

/*
* Alpha composition controls.
*/
NppiAlphaOp :: enum c.int {
    OVER,
    IN,
    OUT,
    ATOP,
    XOR,
    PLUS,
    OVER_PREMUL,
    IN_PREMUL,
    OUT_PREMUL,
    ATOP_PREMUL,
    XOR_PREMUL,
    PLUS_PREMUL,
    PREMUL,
}

NppiHOGConfig :: struct {
    cellSize:            c.int,
    histogramBlockSize:  c.int,
    nHistogramBins:      c.int,
    detectionWindowSize: NppiSize,
}

NPP_HOG_MAX_CELL_SIZE                          :: 16
NPP_HOG_MAX_BLOCK_SIZE                         :: 64
NPP_HOG_MAX_BINS_PER_CELL                      :: 16
NPP_HOG_MAX_CELLS_PER_DESCRIPTOR              :: 256
NPP_HOG_MAX_OVERLAPPING_BLOCKS_PER_DESCRIPTOR :: 256
NPP_HOG_MAX_DESCRIPTOR_LOCATIONS_PER_CALL     :: 128

NppiHaarClassifier_32f :: struct {
    numClassifiers: c.int,
    classifiers:    ^Npp32s,
    classifierStep: c.size_t,
    classifierSize: NppiSize,
    counterDevice:  ^Npp32s,
}

NppiHaarBuffer :: struct {
    haarBufferSize: c.int,
    haarBuffer:     ^Npp32s,
}

NppsZCType :: enum c.int {
    R,
    Xor,
    C,
}

NppiHuffmanTableType :: enum c.int {
    DCTable,
    ACTable,
}

NppiNorm :: enum c.int {
    Inf = 0,
    L1  = 1,
    L2  = 2,
}

NppiConnectedRegion :: struct {
    oBoundingBox:         NppiRect,
    nConnectedPixelCount: Npp32u,
    aSeedPixelValue:      [3]Npp32u,
}

NppiImageDescriptor :: struct {
    pData: rawptr,
    nStep: c.int,
    oSize: NppiSize,
}

NppiBufferDescriptor :: struct {
    pData:       rawptr,
    nBufferSize: c.int,
}

NppiCompressedMarkerLabelsInfo :: struct {
    nMarkerLabelPixelCount:     Npp32u,
    nContourPixelCount:         Npp32u,
    nContourPixelsFound:        Npp32u,
    oContourFirstPixelLocation: NppiPoint,
    oMarkerLabelBoundingBox:    NppiRect,
}

NppiContourBlockSegment :: struct {
    nMarkerLabelID:              Npp32u,
    nContourPixelCount:          Npp32u,
    nContourStartingPixelOffset: Npp32u,
    nSegmentNum:                 Npp32u,
}

NppiContourPixelGeometryInfo :: struct {
    oContourOrderedGeometryLocation: NppiPoint,
    oContourPrevPixelLocation:       NppiPoint,
    oContourCenterPixelLocation:     NppiPoint,
    oContourNextPixelLocation:       NppiPoint,
    nOrderIndex:                     Npp32s,
    nReverseOrderIndex:              Npp32s,
    nFirstIndex:                     Npp32u,
    nLastIndex:                      Npp32u,
    nNextContourPixelIndex:          Npp32u,
    nPrevContourPixelIndex:          Npp32u,
    nPixelAlreadyUsed:               Npp8u,
    nAlreadyLinked:                  Npp8u,
    nAlreadyOutput:                  Npp8u,
    nContourInteriorDirection:       Npp8u,
}

NPP_CONTOUR_DIRECTION_SOUTH_EAST    :: 1
NPP_CONTOUR_DIRECTION_SOUTH         :: 2
NPP_CONTOUR_DIRECTION_SOUTH_WEST    :: 4
NPP_CONTOUR_DIRECTION_WEST          :: 8
NPP_CONTOUR_DIRECTION_EAST         :: 16
NPP_CONTOUR_DIRECTION_NORTH_EAST   :: 32
NPP_CONTOUR_DIRECTION_NORTH        :: 64
NPP_CONTOUR_DIRECTION_NORTH_WEST  :: 128

NPP_CONTOUR_DIRECTION_ANY_NORTH  :: NPP_CONTOUR_DIRECTION_NORTH_EAST | NPP_CONTOUR_DIRECTION_NORTH | NPP_CONTOUR_DIRECTION_NORTH_WEST
NPP_CONTOUR_DIRECTION_ANY_WEST   :: NPP_CONTOUR_DIRECTION_NORTH_WEST | NPP_CONTOUR_DIRECTION_WEST | NPP_CONTOUR_DIRECTION_SOUTH_WEST
NPP_CONTOUR_DIRECTION_ANY_SOUTH  :: NPP_CONTOUR_DIRECTION_SOUTH_EAST | NPP_CONTOUR_DIRECTION_SOUTH | NPP_CONTOUR_DIRECTION_SOUTH_WEST
NPP_CONTOUR_DIRECTION_ANY_EAST   :: NPP_CONTOUR_DIRECTION_NORTH_EAST | NPP_CONTOUR_DIRECTION_EAST | NPP_CONTOUR_DIRECTION_SOUTH_EAST

NppiContourPixelDirectionInfo :: struct {
    nMarkerLabelID:                                                                       Npp32u,
    nContourDirectionCenterPixel:                                                         Npp8u,
    nContourInteriorDirectionCenterPixel:                                                 Npp8u,
    nConnected:                                                                           Npp8u,
    nGeometryInfoIsValid:                                                                 Npp8u,
    oContourPixelGeometryInfo:                                                            NppiContourPixelGeometryInfo,
    nEast1, nNorthEast1, nNorth1, nNorthWest1, nWest1, nSouthWest1, nSouth1, nSouthEast1: NppiPoint,
    nTest1EastConnected:                                                                  Npp8u,
    nTest1NorthEastConnected:                                                             Npp8u,
    nTest1NorthConnected:                                                                 Npp8u,
    nTest1NorthWestConnected:                                                             Npp8u,
    nTest1WestConnected:                                                                  Npp8u,
    nTest1SouthWestConnected:                                                             Npp8u,
    nTest1SouthConnected:                                                                 Npp8u,
    nTest1SouthEastConnected:                                                             Npp8u,
}

NppiContourTotalsInfo :: struct {
    nTotalImagePixelContourCount:   Npp32u,
    nLongestImageContourPixelCount: Npp32u,
}

NppiWatershedSegmentBoundaryType :: enum c.int {
    NONE,
    BLACK,
    WHITE,
    CONTRAST,
    ONLY,
}

NppStreamContext :: struct {
    hStream:                            cuda.CUstream,
    nCudaDeviceId:                      cuda.CUdevice,    /* From cudaGetDevice() */
    nMultiProcessorCount:               c.int,    /* From cudaGetDeviceProperties() */
    nMaxThreadsPerMultiProcessor:       c.int,    /* From cudaGetDeviceProperties() */
    nMaxThreadsPerBlock:                c.int,    /* From cudaGetDeviceProperties() */
    nSharedMemPerBlock:                 c.size_t, /* From cudaGetDeviceProperties */
    nCudaDevAttrComputeCapabilityMajor: c.int,    /* From cudaGetDeviceAttribute() */
    nCudaDevAttrComputeCapabilityMinor: c.int,    /* From cudaGetDeviceAttribute() */
    nStreamFlags:                       c.uint,   /* From cudaStreamGetFlags() */
    nReserved0:                         c.int,
}

NppiColorTwistBatchCXR :: struct {
    pSrc:     rawptr,  /* device memory pointer */
    nSrcStep: c.int,
    pDst:     rawptr,  /* device memory pointer */
    nDstStep: c.int,
    pTwist:   ^Npp32f, /* device memory pointer to the color twist matrix with floating-point coefficient values to be used for this image */
}

when (ODIN_OS == .Windows) {
    foreign import lib "system:libnppicc.lib"
} else {
    foreign import lib "system:libnppicc.so"
}

@(default_calling_convention = "stdcall" when (ODIN_OS == .Windows) else "c")
foreign lib {
    nppiRGBToYUV_8u_C3R_Ctx                      :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToYUV_8u_C3R                          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToYUV_8u_AC4R_Ctx                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToYUV_8u_AC4R                         :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToYUV_8u_P3R_Ctx                      :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToYUV_8u_P3R                          :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToYUV_8u_C3P3R_Ctx                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToYUV_8u_C3P3R                        :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToYUV_8u_AC4P4R_Ctx                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[4]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToYUV_8u_AC4P4R                       :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[4]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiBGRToYUV_8u_C3R_Ctx                      :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToYUV_8u_C3R                          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiBGRToYUV_8u_AC4R_Ctx                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToYUV_8u_AC4R                         :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiBGRToYUV_8u_P3R_Ctx                      :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToYUV_8u_P3R                          :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiBGRToYUV_8u_C3P3R_Ctx                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToYUV_8u_C3P3R                        :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiBGRToYUV_8u_AC4P4R_Ctx                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[4]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToYUV_8u_AC4P4R                       :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[4]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYUVToRGB_8u_C3R_Ctx                      :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYUVToRGB_8u_C3R                          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYUVToRGB_8u_AC4R_Ctx                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYUVToRGB_8u_AC4R                         :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYUVToRGB_8u_P3R_Ctx                      :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYUVToRGB_8u_P3R                          :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYUVToRGB_8u_P3C3R_Ctx                    :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYUVToRGB_8u_P3C3R                        :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYUVToRGBBatch_8u_C3R_Ctx                 :: proc(pSrcBatchList: ^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYUVToRGBBatch_8u_C3R                     :: proc(pSrcBatchList: ^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYUVToRGBBatch_8u_P3C3R_Ctx               :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYUVToRGBBatch_8u_P3C3R                   :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYUVToRGBBatch_8u_C3R_Advanced_Ctx        :: proc(pSrcBatchList: ^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oMaxSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYUVToRGBBatch_8u_C3R_Advanced            :: proc(pSrcBatchList: ^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oMaxSizeROI: NppiSize) -> NppStatus ---
    nppiYUVToRGBBatch_8u_P3C3R_Advanced_Ctx      :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oMaxSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYUVToRGBBatch_8u_P3C3R_Advanced          :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oMaxSizeROI: NppiSize) -> NppStatus ---
    nppiYUVToBGR_8u_C3R_Ctx                      :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYUVToBGR_8u_C3R                          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYUVToBGR_8u_AC4R_Ctx                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYUVToBGR_8u_AC4R                         :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYUVToBGR_8u_P3R_Ctx                      :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYUVToBGR_8u_P3R                          :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYUVToBGR_8u_P3C3R_Ctx                    :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYUVToBGR_8u_P3C3R                        :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYUVToBGRBatch_8u_C3R_Ctx                 :: proc(pSrcBatchList: ^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYUVToBGRBatch_8u_C3R                     :: proc(pSrcBatchList: ^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYUVToBGRBatch_8u_P3C3R_Ctx               :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYUVToBGRBatch_8u_P3C3R                   :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYUVToBGRBatch_8u_C3R_Advanced_Ctx        :: proc(pSrcBatchList: ^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oMaxSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYUVToBGRBatch_8u_C3R_Advanced            :: proc(pSrcBatchList: ^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oMaxSizeROI: NppiSize) -> NppStatus ---
    nppiYUVToBGRBatch_8u_P3C3R_Advanced_Ctx      :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oMaxSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYUVToBGRBatch_8u_P3C3R_Advanced          :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oMaxSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToYUV422_8u_C3C2R_Ctx                 :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToYUV422_8u_C3C2R                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToYUV422_8u_P3R_Ctx                   :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToYUV422_8u_P3R                       :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToYUV422_8u_C3P3R_Ctx                 :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToYUV422_8u_C3P3R                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYUV422ToRGB_8u_C2C3R_Ctx                 :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYUV422ToRGB_8u_C2C3R                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYUV422ToRGB_8u_P3R_Ctx                   :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYUV422ToRGB_8u_P3R                       :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYUV422ToRGB_8u_P3C3R_Ctx                 :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYUV422ToRGB_8u_P3C3R                     :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYUV422ToRGB_8u_P3AC4R_Ctx                :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYUV422ToRGB_8u_P3AC4R                    :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYUV422ToRGBBatch_8u_P3C3R_Ctx            :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYUV422ToRGBBatch_8u_P3C3R                :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYUV422ToRGBBatch_8u_P3C3R_Advanced_Ctx   :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oMaxSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYUV422ToRGBBatch_8u_P3C3R_Advanced       :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oMaxSizeROI: NppiSize) -> NppStatus ---
    nppiYUV422ToBGRBatch_8u_P3C3R_Ctx            :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYUV422ToBGRBatch_8u_P3C3R                :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYUV422ToBGRBatch_8u_P3C3R_Advanced_Ctx   :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oMaxSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYUV422ToBGRBatch_8u_P3C3R_Advanced       :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oMaxSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToYUV420_8u_P3R_Ctx                   :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToYUV420_8u_P3R                       :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToYUV420_8u_C3P3R_Ctx                 :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToYUV420_8u_C3P3R                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYUV420ToRGB_8u_P3R_Ctx                   :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYUV420ToRGB_8u_P3R                       :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYUV420ToRGB_8u_P3C3R_Ctx                 :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYUV420ToRGB_8u_P3C3R                     :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYUV420ToRGB_8u_P3C4R_Ctx                 :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYUV420ToRGB_8u_P3C4R                     :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYUV420ToRGB_8u_P3AC4R_Ctx                :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYUV420ToRGB_8u_P3AC4R                    :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYUV420ToRGBBatch_8u_P3C3R_Ctx            :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYUV420ToRGBBatch_8u_P3C3R                :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYUV420ToRGBBatch_8u_P3C3R_Advanced_Ctx   :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oMaxSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYUV420ToRGBBatch_8u_P3C3R_Advanced       :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oMaxSizeROI: NppiSize) -> NppStatus ---
    nppiNV12ToRGB_8u_P2C3R_Ctx                   :: proc(pSrc: ^[2]cuda.CUdeviceptr, rSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiNV12ToRGB_8u_P2C3R                       :: proc(pSrc: ^[2]cuda.CUdeviceptr, rSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiNV12ToRGB_709HDTV_8u_P2C3R_Ctx           :: proc(pSrc: ^[2]cuda.CUdeviceptr, rSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiNV12ToRGB_709HDTV_8u_P2C3R               :: proc(pSrc: ^[2]cuda.CUdeviceptr, rSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiNV12ToRGB_709CSC_8u_P2C3R_Ctx            :: proc(pSrc: ^[2]cuda.CUdeviceptr, rSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiNV12ToRGB_709CSC_8u_P2C3R                :: proc(pSrc: ^[2]cuda.CUdeviceptr, rSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiNV21ToRGB_8u_P2C4R_Ctx                   :: proc(pSrc: ^[2]cuda.CUdeviceptr, rSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiNV21ToRGB_8u_P2C4R                       :: proc(pSrc: ^[2]cuda.CUdeviceptr, rSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiBGRToYUV420_8u_AC4P3R_Ctx                :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToYUV420_8u_AC4P3R                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYUV420ToBGR_8u_P3C3R_Ctx                 :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYUV420ToBGR_8u_P3C3R                     :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYUV420ToBGR_8u_P3C4R_Ctx                 :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYUV420ToBGR_8u_P3C4R                     :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYUV420ToBGRBatch_8u_P3C3R_Ctx            :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYUV420ToBGRBatch_8u_P3C3R                :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYUV420ToBGRBatch_8u_P3C3R_Advanced_Ctx   :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oMaxSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYUV420ToBGRBatch_8u_P3C3R_Advanced       :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oMaxSizeROI: NppiSize) -> NppStatus ---
    nppiNV12ToBGR_8u_P2C3R_Ctx                   :: proc(pSrc: ^[2]cuda.CUdeviceptr, rSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiNV12ToBGR_8u_P2C3R                       :: proc(pSrc: ^[2]cuda.CUdeviceptr, rSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiNV12ToBGR_709HDTV_8u_P2C3R_Ctx           :: proc(pSrc: ^[2]cuda.CUdeviceptr, rSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiNV12ToBGR_709HDTV_8u_P2C3R               :: proc(pSrc: ^[2]cuda.CUdeviceptr, rSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiNV12ToBGR_709CSC_8u_P2C3R_Ctx            :: proc(pSrc: ^[2]cuda.CUdeviceptr, rSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiNV12ToBGR_709CSC_8u_P2C3R                :: proc(pSrc: ^[2]cuda.CUdeviceptr, rSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiNV21ToBGR_8u_P2C4R_Ctx                   :: proc(pSrc: ^[2]cuda.CUdeviceptr, rSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiNV21ToBGR_8u_P2C4R                       :: proc(pSrc: ^[2]cuda.CUdeviceptr, rSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToYCbCr_8u_C3R_Ctx                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToYCbCr_8u_C3R                        :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToYCbCr_8u_AC4R_Ctx                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToYCbCr_8u_AC4R                       :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToYCbCr_8u_P3R_Ctx                    :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToYCbCr_8u_P3R                        :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToYCbCr_8u_C3P3R_Ctx                  :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToYCbCr_8u_C3P3R                      :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToYCbCr_8u_AC4P3R_Ctx                 :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToYCbCr_8u_AC4P3R                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCrToRGB_8u_C3R_Ctx                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCrToRGB_8u_C3R                        :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCrToRGB_8u_AC4R_Ctx                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCrToRGB_8u_AC4R                       :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCrToRGB_8u_P3R_Ctx                    :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCrToRGB_8u_P3R                        :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCrToRGB_8u_P3C3R_Ctx                  :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCrToRGB_8u_P3C3R                      :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCrToRGB_8u_P3C4R_Ctx                  :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nAval: Npp8u, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCrToRGB_8u_P3C4R                      :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nAval: Npp8u) -> NppStatus ---
    nppiYCbCrToRGBBatch_8u_C3R_Ctx               :: proc(pSrcBatchList: ^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCrToRGBBatch_8u_C3R                   :: proc(pSrcBatchList: ^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCrToRGBBatch_8u_P3C3R_Ctx             :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCrToRGBBatch_8u_P3C3R                 :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCrToRGBBatch_8u_C3R_Advanced_Ctx      :: proc(pSrcBatchList: ^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oMaxSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCrToRGBBatch_8u_C3R_Advanced          :: proc(pSrcBatchList: ^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oMaxSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCrToRGBBatch_8u_P3C3R_Advanced_Ctx    :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oMaxSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCrToRGBBatch_8u_P3C3R_Advanced        :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oMaxSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCrToBGR_8u_P3C3R_Ctx                  :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCrToBGR_8u_P3C3R                      :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCrToBGR_8u_P3C4R_Ctx                  :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nAval: Npp8u, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCrToBGR_8u_P3C4R                      :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nAval: Npp8u) -> NppStatus ---
    nppiYCbCrToBGRBatch_8u_C3R_Ctx               :: proc(pSrcBatchList: ^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCrToBGRBatch_8u_C3R                   :: proc(pSrcBatchList: ^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCrToBGRBatch_8u_P3C3R_Ctx             :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCrToBGRBatch_8u_P3C3R                 :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCrToBGRBatch_8u_C3R_Advanced_Ctx      :: proc(pSrcBatchList: ^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oMaxSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCrToBGRBatch_8u_C3R_Advanced          :: proc(pSrcBatchList: ^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oMaxSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCrToBGRBatch_8u_P3C3R_Advanced_Ctx    :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oMaxSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCrToBGRBatch_8u_P3C3R_Advanced        :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oMaxSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCrToBGR_709CSC_8u_P3C3R_Ctx           :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCrToBGR_709CSC_8u_P3C3R               :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCrToBGR_709CSC_8u_P3C4R_Ctx           :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nAval: Npp8u, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCrToBGR_709CSC_8u_P3C4R               :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nAval: Npp8u) -> NppStatus ---
    nppiRGBToYCbCr422_8u_C3C2R_Ctx               :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToYCbCr422_8u_C3C2R                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToYCbCr422_8u_C3P3R_Ctx               :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToYCbCr422_8u_C3P3R                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToYCbCr422_8u_P3C2R_Ctx               :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToYCbCr422_8u_P3C2R                   :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr422ToRGB_8u_C2C3R_Ctx               :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr422ToRGB_8u_C2C3R                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr422ToRGB_8u_C2P3R_Ctx               :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr422ToRGB_8u_C2P3R                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr422ToRGB_8u_P3C3R_Ctx               :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr422ToRGB_8u_P3C3R                   :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr422ToRGBBatch_8u_P3C3R_Ctx          :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr422ToRGBBatch_8u_P3C3R              :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr422ToRGBBatch_8u_P3C3R_Advanced_Ctx :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oMaxSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr422ToRGBBatch_8u_P3C3R_Advanced     :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oMaxSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToYCrCb422_8u_C3C2R_Ctx               :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToYCrCb422_8u_C3C2R                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToYCrCb422_8u_P3C2R_Ctx               :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToYCrCb422_8u_P3C2R                   :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCrCb422ToRGB_8u_C2C3R_Ctx               :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCrCb422ToRGB_8u_C2C3R                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCrCb422ToRGB_8u_C2P3R_Ctx               :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCrCb422ToRGB_8u_C2P3R                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiBGRToYCbCr422_8u_C3C2R_Ctx               :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToYCbCr422_8u_C3C2R                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiBGRToYCbCr422_8u_AC4C2R_Ctx              :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToYCbCr422_8u_AC4C2R                  :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiBGRToYCbCr422_8u_C3P3R_Ctx               :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToYCbCr422_8u_C3P3R                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiBGRToYCbCr422_8u_AC4P3R_Ctx              :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToYCbCr422_8u_AC4P3R                  :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr422ToBGR_8u_C2C3R_Ctx               :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr422ToBGR_8u_C2C3R                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr422ToBGR_8u_C2C4R_Ctx               :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nAval: Npp8u, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr422ToBGR_8u_C2C4R                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nAval: Npp8u) -> NppStatus ---
    nppiYCbCr422ToBGR_8u_P3C3R_Ctx               :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr422ToBGR_8u_P3C3R                   :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr422ToBGRBatch_8u_P3C3R_Ctx          :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr422ToBGRBatch_8u_P3C3R              :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr422ToBGRBatch_8u_P3C3R_Advanced_Ctx :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oMaxSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr422ToBGRBatch_8u_P3C3R_Advanced     :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oMaxSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToCbYCr422_8u_C3C2R_Ctx               :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToCbYCr422_8u_C3C2R                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToCbYCr422Gamma_8u_C3C2R_Ctx          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToCbYCr422Gamma_8u_C3C2R              :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiCbYCr422ToRGB_8u_C2C3R_Ctx               :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiCbYCr422ToRGB_8u_C2C3R                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiBGRToCbYCr422_8u_AC4C2R_Ctx              :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToCbYCr422_8u_AC4C2R                  :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiBGRToCbYCr422_709HDTV_8u_C3C2R_Ctx       :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToCbYCr422_709HDTV_8u_C3C2R           :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiBGRToCbYCr422_709HDTV_8u_AC4C2R_Ctx      :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToCbYCr422_709HDTV_8u_AC4C2R          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiCbYCr422ToBGR_8u_C2C4R_Ctx               :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nAval: Npp8u, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiCbYCr422ToBGR_8u_C2C4R                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nAval: Npp8u) -> NppStatus ---
    nppiCbYCr422ToBGR_709HDTV_8u_C2C3R_Ctx       :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiCbYCr422ToBGR_709HDTV_8u_C2C3R           :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiCbYCr422ToBGR_709HDTV_8u_C2C4R_Ctx       :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nAval: Npp8u, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiCbYCr422ToBGR_709HDTV_8u_C2C4R           :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nAval: Npp8u) -> NppStatus ---
    nppiRGBToYCbCr420_8u_C3P3R_Ctx               :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToYCbCr420_8u_C3P3R                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr420ToRGB_8u_P3C3R_Ctx               :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr420ToRGB_8u_P3C3R                   :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr420ToRGBBatch_8u_P3C3R_Ctx          :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr420ToRGBBatch_8u_P3C3R              :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr420ToRGBBatch_8u_P3C3R_Advanced_Ctx :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oMaxSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr420ToRGBBatch_8u_P3C3R_Advanced     :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oMaxSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToYCrCb420_8u_AC4P3R_Ctx              :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToYCrCb420_8u_AC4P3R                  :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCrCb420ToRGB_8u_P3C4R_Ctx               :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nAval: Npp8u, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCrCb420ToRGB_8u_P3C4R                   :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nAval: Npp8u) -> NppStatus ---
    nppiBGRToYCbCr420_8u_C3P3R_Ctx               :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToYCbCr420_8u_C3P3R                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiBGRToYCbCr420_8u_AC4P3R_Ctx              :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToYCbCr420_8u_AC4P3R                  :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiBGRToYCbCr420_709CSC_8u_C3P3R_Ctx        :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToYCbCr420_709CSC_8u_C3P3R            :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiBGRToYCbCr420_709CSC_8u_AC4P3R_Ctx       :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToYCbCr420_709CSC_8u_AC4P3R           :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiBGRToYCbCr420_709HDTV_8u_AC4P3R_Ctx      :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToYCbCr420_709HDTV_8u_AC4P3R          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiBGRToYCrCb420_709CSC_8u_C3P3R_Ctx        :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToYCrCb420_709CSC_8u_C3P3R            :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiBGRToYCrCb420_709CSC_8u_AC4P3R_Ctx       :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToYCrCb420_709CSC_8u_AC4P3R           :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr420ToBGR_8u_P3C3R_Ctx               :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr420ToBGR_8u_P3C3R                   :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr420ToBGR_8u_P3C4R_Ctx               :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nAval: Npp8u, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr420ToBGR_8u_P3C4R                   :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nAval: Npp8u) -> NppStatus ---
    nppiYCbCr420ToBGRBatch_8u_P3C3R_Ctx          :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr420ToBGRBatch_8u_P3C3R              :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr420ToBGRBatch_8u_P3C3R_Advanced_Ctx :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oMaxSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr420ToBGRBatch_8u_P3C3R_Advanced     :: proc(pSrcBatchList: ^^NppiImageDescriptor, pDstBatchList: ^NppiImageDescriptor, nBatchSize: c.int, oMaxSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr420ToBGR_709CSC_8u_P3C3R_Ctx        :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr420ToBGR_709CSC_8u_P3C3R            :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr420ToBGR_709HDTV_8u_P3C4R_Ctx       :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nAval: Npp8u, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr420ToBGR_709HDTV_8u_P3C4R           :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nAval: Npp8u) -> NppStatus ---
    nppiBGRToYCrCb420_8u_C3P3R_Ctx               :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToYCrCb420_8u_C3P3R                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiBGRToYCrCb420_8u_AC4P3R_Ctx              :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToYCrCb420_8u_AC4P3R                  :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiBGRToYCbCr411_8u_C3P3R_Ctx               :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToYCbCr411_8u_C3P3R                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiBGRToYCbCr411_8u_AC4P3R_Ctx              :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToYCbCr411_8u_AC4P3R                  :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToYCbCr411_8u_C3P3R_Ctx               :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToYCbCr411_8u_C3P3R                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToYCbCr411_8u_AC4P3R_Ctx              :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToYCbCr411_8u_AC4P3R                  :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiBGRToYCbCr_8u_C3P3R_Ctx                  :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToYCbCr_8u_C3P3R                      :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiBGRToYCbCr_8u_AC4P3R_Ctx                 :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToYCbCr_8u_AC4P3R                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiBGRToYCbCr_8u_AC4P4R_Ctx                 :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[4]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToYCbCr_8u_AC4P4R                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[4]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr411ToBGR_8u_P3C3R_Ctx               :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr411ToBGR_8u_P3C3R                   :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr411ToBGR_8u_P3C4R_Ctx               :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nAval: Npp8u, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr411ToBGR_8u_P3C4R                   :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nAval: Npp8u) -> NppStatus ---
    nppiYCbCr411ToRGB_8u_P3C3R_Ctx               :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr411ToRGB_8u_P3C3R                   :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr411ToRGB_8u_P3C4R_Ctx               :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nAval: Npp8u, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr411ToRGB_8u_P3C4R                   :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nAval: Npp8u) -> NppStatus ---
    nppiRGBToXYZ_8u_C3R_Ctx                      :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToXYZ_8u_C3R                          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToXYZ_8u_AC4R_Ctx                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToXYZ_8u_AC4R                         :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiXYZToRGB_8u_C3R_Ctx                      :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiXYZToRGB_8u_C3R                          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiXYZToRGB_8u_AC4R_Ctx                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiXYZToRGB_8u_AC4R                         :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToLUV_8u_C3R_Ctx                      :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToLUV_8u_C3R                          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToLUV_8u_AC4R_Ctx                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToLUV_8u_AC4R                         :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiLUVToRGB_8u_C3R_Ctx                      :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUVToRGB_8u_C3R                          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiLUVToRGB_8u_AC4R_Ctx                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUVToRGB_8u_AC4R                         :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiBGRToLab_8u_C3R_Ctx                      :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToLab_8u_C3R                          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiLabToBGR_8u_C3R_Ctx                      :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLabToBGR_8u_C3R                          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToYCC_8u_C3R_Ctx                      :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToYCC_8u_C3R                          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToYCC_8u_AC4R_Ctx                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToYCC_8u_AC4R                         :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCCToRGB_8u_C3R_Ctx                      :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCCToRGB_8u_C3R                          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCCToRGB_8u_AC4R_Ctx                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCCToRGB_8u_AC4R                         :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCCKToCMYK_JPEG_601_8u_P4R_Ctx           :: proc(pSrc: ^[4]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[4]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCCKToCMYK_JPEG_601_8u_P4R               :: proc(pSrc: ^[4]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[4]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiCMYKOrYCCKToRGB_JPEG_8u_P4P3R_Ctx        :: proc(pSrc: ^[4]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiCMYKOrYCCKToRGB_JPEG_8u_P4P3R            :: proc(pSrc: ^[4]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiCMYKOrYCCKToRGB_JPEG_8u_P4C3R_Ctx        :: proc(pSrc: ^[4]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiCMYKOrYCCKToRGB_JPEG_8u_P4C3R            :: proc(pSrc: ^[4]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiCMYKOrYCCKToBGR_JPEG_8u_P4P3R_Ctx        :: proc(pSrc: ^[4]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiCMYKOrYCCKToBGR_JPEG_8u_P4P3R            :: proc(pSrc: ^[4]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiCMYKOrYCCKToBGR_JPEG_8u_P4C3R_Ctx        :: proc(pSrc: ^[4]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiCMYKOrYCCKToBGR_JPEG_8u_P4C3R            :: proc(pSrc: ^[4]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToHLS_8u_C3R_Ctx                      :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToHLS_8u_C3R                          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToHLS_8u_AC4R_Ctx                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToHLS_8u_AC4R                         :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiHLSToRGB_8u_C3R_Ctx                      :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiHLSToRGB_8u_C3R                          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiHLSToRGB_8u_AC4R_Ctx                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiHLSToRGB_8u_AC4R                         :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiBGRToHLS_8u_AC4R_Ctx                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToHLS_8u_AC4R                         :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiBGRToHLS_8u_C3P3R_Ctx                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToHLS_8u_C3P3R                        :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiBGRToHLS_8u_AC4P4R_Ctx                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[4]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToHLS_8u_AC4P4R                       :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[4]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiBGRToHLS_8u_P3C3R_Ctx                    :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToHLS_8u_P3C3R                        :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiBGRToHLS_8u_AP4C4R_Ctx                   :: proc(pSrc: ^[4]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToHLS_8u_AP4C4R                       :: proc(pSrc: ^[4]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiBGRToHLS_8u_P3R_Ctx                      :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToHLS_8u_P3R                          :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiBGRToHLS_8u_AP4R_Ctx                     :: proc(pSrc: ^[4]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[4]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToHLS_8u_AP4R                         :: proc(pSrc: ^[4]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[4]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiHLSToBGR_8u_C3P3R_Ctx                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiHLSToBGR_8u_C3P3R                        :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiHLSToBGR_8u_AC4P4R_Ctx                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[4]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiHLSToBGR_8u_AC4P4R                       :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[4]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiHLSToBGR_8u_P3R_Ctx                      :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiHLSToBGR_8u_P3R                          :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiHLSToBGR_8u_AP4R_Ctx                     :: proc(pSrc: ^[4]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[4]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiHLSToBGR_8u_AP4R                         :: proc(pSrc: ^[4]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[4]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiHLSToBGR_8u_P3C3R_Ctx                    :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiHLSToBGR_8u_P3C3R                        :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiHLSToBGR_8u_AP4C4R_Ctx                   :: proc(pSrc: ^[4]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiHLSToBGR_8u_AP4C4R                       :: proc(pSrc: ^[4]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToHSV_8u_C3R_Ctx                      :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToHSV_8u_C3R                          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToHSV_8u_AC4R_Ctx                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToHSV_8u_AC4R                         :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiHSVToRGB_8u_C3R_Ctx                      :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiHSVToRGB_8u_C3R                          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiHSVToRGB_8u_AC4R_Ctx                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiHSVToRGB_8u_AC4R                         :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToYCbCr420_JPEG_8u_P3R_Ctx            :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, aDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToYCbCr420_JPEG_8u_P3R                :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, aDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToYCbCr422_JPEG_8u_P3R_Ctx            :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, aDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToYCbCr422_JPEG_8u_P3R                :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, aDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToYCbCr411_JPEG_8u_P3R_Ctx            :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, aDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToYCbCr411_JPEG_8u_P3R                :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, aDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToYCbCr444_JPEG_8u_P3R_Ctx            :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToYCbCr444_JPEG_8u_P3R                :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiBGRToYCbCr420_JPEG_8u_P3R_Ctx            :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, aDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToYCbCr420_JPEG_8u_P3R                :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, aDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiBGRToYCbCr422_JPEG_8u_P3R_Ctx            :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, aDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToYCbCr422_JPEG_8u_P3R                :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, aDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiBGRToYCbCr411_JPEG_8u_P3R_Ctx            :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, aDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToYCbCr411_JPEG_8u_P3R                :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, aDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiBGRToYCbCr444_JPEG_8u_P3R_Ctx            :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToYCbCr444_JPEG_8u_P3R                :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr420ToRGB_JPEG_8u_P3R_Ctx            :: proc(pSrc: ^[3]cuda.CUdeviceptr, aSrcStep: ^c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr420ToRGB_JPEG_8u_P3R                :: proc(pSrc: ^[3]cuda.CUdeviceptr, aSrcStep: ^c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr422ToRGB_JPEG_8u_P3R_Ctx            :: proc(pSrc: ^[3]cuda.CUdeviceptr, aSrcStep: ^c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr422ToRGB_JPEG_8u_P3R                :: proc(pSrc: ^[3]cuda.CUdeviceptr, aSrcStep: ^c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr411ToRGB_JPEG_8u_P3R_Ctx            :: proc(pSrc: ^[3]cuda.CUdeviceptr, aSrcStep: ^c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr411ToRGB_JPEG_8u_P3R                :: proc(pSrc: ^[3]cuda.CUdeviceptr, aSrcStep: ^c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr444ToRGB_JPEG_8u_P3R_Ctx            :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr444ToRGB_JPEG_8u_P3R                :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr420ToBGR_JPEG_8u_P3R_Ctx            :: proc(pSrc: ^[3]cuda.CUdeviceptr, aSrcStep: ^c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr420ToBGR_JPEG_8u_P3R                :: proc(pSrc: ^[3]cuda.CUdeviceptr, aSrcStep: ^c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr422ToBGR_JPEG_8u_P3R_Ctx            :: proc(pSrc: ^[3]cuda.CUdeviceptr, aSrcStep: ^c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr422ToBGR_JPEG_8u_P3R                :: proc(pSrc: ^[3]cuda.CUdeviceptr, aSrcStep: ^c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr411ToBGR_JPEG_8u_P3R_Ctx            :: proc(pSrc: ^[3]cuda.CUdeviceptr, aSrcStep: ^c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr411ToBGR_JPEG_8u_P3R                :: proc(pSrc: ^[3]cuda.CUdeviceptr, aSrcStep: ^c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr444ToBGR_JPEG_8u_P3R_Ctx            :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr444ToBGR_JPEG_8u_P3R                :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToYCbCr420_JPEG_8u_C3P3R_Ctx          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, aDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToYCbCr420_JPEG_8u_C3P3R              :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, aDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToYCbCr422_JPEG_8u_C3P3R_Ctx          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, aDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToYCbCr422_JPEG_8u_C3P3R              :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, aDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToYCbCr411_JPEG_8u_C3P3R_Ctx          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, aDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToYCbCr411_JPEG_8u_C3P3R              :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, aDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToYCbCr444_JPEG_8u_C3P3R_Ctx          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToYCbCr444_JPEG_8u_C3P3R              :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiBGRToYCbCr420_JPEG_8u_C3P3R_Ctx          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, aDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToYCbCr420_JPEG_8u_C3P3R              :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, aDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiBGRToYCbCr422_JPEG_8u_C3P3R_Ctx          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, aDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToYCbCr422_JPEG_8u_C3P3R              :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, aDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiBGRToYCbCr411_JPEG_8u_C3P3R_Ctx          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, aDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToYCbCr411_JPEG_8u_C3P3R              :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, aDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiBGRToYCbCr444_JPEG_8u_C3P3R_Ctx          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiBGRToYCbCr444_JPEG_8u_C3P3R              :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr420ToRGB_JPEG_8u_P3C3R_Ctx          :: proc(pSrc: ^[3]cuda.CUdeviceptr, aSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr420ToRGB_JPEG_8u_P3C3R              :: proc(pSrc: ^[3]cuda.CUdeviceptr, aSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr422ToRGB_JPEG_8u_P3C3R_Ctx          :: proc(pSrc: ^[3]cuda.CUdeviceptr, aSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr422ToRGB_JPEG_8u_P3C3R              :: proc(pSrc: ^[3]cuda.CUdeviceptr, aSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr411ToRGB_JPEG_8u_P3C3R_Ctx          :: proc(pSrc: ^[3]cuda.CUdeviceptr, aSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr411ToRGB_JPEG_8u_P3C3R              :: proc(pSrc: ^[3]cuda.CUdeviceptr, aSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr444ToRGB_JPEG_8u_P3C3R_Ctx          :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr444ToRGB_JPEG_8u_P3C3R              :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr420ToBGR_JPEG_8u_P3C3R_Ctx          :: proc(pSrc: ^[3]cuda.CUdeviceptr, aSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr420ToBGR_JPEG_8u_P3C3R              :: proc(pSrc: ^[3]cuda.CUdeviceptr, aSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr422ToBGR_JPEG_8u_P3C3R_Ctx          :: proc(pSrc: ^[3]cuda.CUdeviceptr, aSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr422ToBGR_JPEG_8u_P3C3R              :: proc(pSrc: ^[3]cuda.CUdeviceptr, aSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr411ToBGR_JPEG_8u_P3C3R_Ctx          :: proc(pSrc: ^[3]cuda.CUdeviceptr, aSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr411ToBGR_JPEG_8u_P3C3R              :: proc(pSrc: ^[3]cuda.CUdeviceptr, aSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr444ToBGR_JPEG_8u_P3C3R_Ctx          :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr444ToBGR_JPEG_8u_P3C3R              :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToGray_8u_C3C1R_Ctx                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToGray_8u_C3C1R                       :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToGray_8u_AC4C1R_Ctx                  :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToGray_8u_AC4C1R                      :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToGray_16u_C3C1R_Ctx                  :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToGray_16u_C3C1R                      :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToGray_16u_AC4C1R_Ctx                 :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToGray_16u_AC4C1R                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToGray_16s_C3C1R_Ctx                  :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToGray_16s_C3C1R                      :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToGray_16s_AC4C1R_Ctx                 :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToGray_16s_AC4C1R                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToGray_32f_C3C1R_Ctx                  :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToGray_32f_C3C1R                      :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiRGBToGray_32f_AC4C1R_Ctx                 :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiRGBToGray_32f_AC4C1R                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiColorToGray_8u_C3C1R_Ctx                 :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, aCoeffs: ^Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorToGray_8u_C3C1R                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, aCoeffs: ^Npp32f) -> NppStatus ---
    nppiColorToGray_8u_AC4C1R_Ctx                :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, aCoeffs: ^Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorToGray_8u_AC4C1R                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, aCoeffs: ^Npp32f) -> NppStatus ---
    nppiColorToGray_8u_C4C1R_Ctx                 :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, aCoeffs: ^Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorToGray_8u_C4C1R                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, aCoeffs: ^Npp32f) -> NppStatus ---
    nppiColorToGray_16u_C3C1R_Ctx                :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, aCoeffs: ^Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorToGray_16u_C3C1R                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, aCoeffs: ^Npp32f) -> NppStatus ---
    nppiColorToGray_16u_AC4C1R_Ctx               :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, aCoeffs: ^Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorToGray_16u_AC4C1R                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, aCoeffs: ^Npp32f) -> NppStatus ---
    nppiColorToGray_16u_C4C1R_Ctx                :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, aCoeffs: ^Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorToGray_16u_C4C1R                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, aCoeffs: ^Npp32f) -> NppStatus ---
    nppiColorToGray_16s_C3C1R_Ctx                :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, aCoeffs: ^Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorToGray_16s_C3C1R                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, aCoeffs: ^Npp32f) -> NppStatus ---
    nppiColorToGray_16s_AC4C1R_Ctx               :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, aCoeffs: ^Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorToGray_16s_AC4C1R                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, aCoeffs: ^Npp32f) -> NppStatus ---
    nppiColorToGray_16s_C4C1R_Ctx                :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, aCoeffs: ^Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorToGray_16s_C4C1R                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, aCoeffs: ^Npp32f) -> NppStatus ---
    nppiColorToGray_32f_C3C1R_Ctx                :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, aCoeffs: ^Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorToGray_32f_C3C1R                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, aCoeffs: ^Npp32f) -> NppStatus ---
    nppiColorToGray_32f_AC4C1R_Ctx               :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, aCoeffs: ^Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorToGray_32f_AC4C1R                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, aCoeffs: ^Npp32f) -> NppStatus ---
    nppiColorToGray_32f_C4C1R_Ctx                :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, aCoeffs: ^Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorToGray_32f_C4C1R                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, aCoeffs: ^Npp32f) -> NppStatus ---
    nppiGradientColorToGray_8u_C3C1R_Ctx         :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, eNorm: NppiNorm, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiGradientColorToGray_8u_C3C1R             :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, eNorm: NppiNorm) -> NppStatus ---
    nppiGradientColorToGray_16u_C3C1R_Ctx        :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, eNorm: NppiNorm, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiGradientColorToGray_16u_C3C1R            :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, eNorm: NppiNorm) -> NppStatus ---
    nppiGradientColorToGray_16s_C3C1R_Ctx        :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, eNorm: NppiNorm, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiGradientColorToGray_16s_C3C1R            :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, eNorm: NppiNorm) -> NppStatus ---
    nppiGradientColorToGray_32f_C3C1R_Ctx        :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, eNorm: NppiNorm, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiGradientColorToGray_32f_C3C1R            :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, eNorm: NppiNorm) -> NppStatus ---
    nppiCFAToRGB_8u_C1C3R_Ctx                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, oSrcSize: NppiSize, oSrcROI: NppiRect, pDst: ^Npp8u, nDstStep: c.int, eGrid: NppiBayerGridPosition, eInterpolation: NppiInterpolationMode, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiCFAToRGB_8u_C1C3R                        :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, oSrcSize: NppiSize, oSrcROI: NppiRect, pDst: ^Npp8u, nDstStep: c.int, eGrid: NppiBayerGridPosition, eInterpolation: NppiInterpolationMode) -> NppStatus ---
    nppiCFAToRGBA_8u_C1AC4R_Ctx                  :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, oSrcSize: NppiSize, oSrcROI: NppiRect, pDst: ^Npp8u, nDstStep: c.int, eGrid: NppiBayerGridPosition, eInterpolation: NppiInterpolationMode, nAlpha: Npp8u, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiCFAToRGBA_8u_C1AC4R                      :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, oSrcSize: NppiSize, oSrcROI: NppiRect, pDst: ^Npp8u, nDstStep: c.int, eGrid: NppiBayerGridPosition, eInterpolation: NppiInterpolationMode, nAlpha: Npp8u) -> NppStatus ---
    nppiCFAToRGB_16u_C1C3R_Ctx                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, oSrcSize: NppiSize, oSrcROI: NppiRect, pDst: ^Npp16u, nDstStep: c.int, eGrid: NppiBayerGridPosition, eInterpolation: NppiInterpolationMode, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiCFAToRGB_16u_C1C3R                       :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, oSrcSize: NppiSize, oSrcROI: NppiRect, pDst: ^Npp16u, nDstStep: c.int, eGrid: NppiBayerGridPosition, eInterpolation: NppiInterpolationMode) -> NppStatus ---
    nppiCFAToRGBA_16u_C1AC4R_Ctx                 :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, oSrcSize: NppiSize, oSrcROI: NppiRect, pDst: ^Npp16u, nDstStep: c.int, eGrid: NppiBayerGridPosition, eInterpolation: NppiInterpolationMode, nAlpha: Npp16u, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiCFAToRGBA_16u_C1AC4R                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, oSrcSize: NppiSize, oSrcROI: NppiRect, pDst: ^Npp16u, nDstStep: c.int, eGrid: NppiBayerGridPosition, eInterpolation: NppiInterpolationMode, nAlpha: Npp16u) -> NppStatus ---
    nppiYCbCr420ToYCbCr411_8u_P3P2R_Ctx          :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDstY: ^Npp8u, nDstYStep: c.int, pDstCbCr: ^Npp8u, nDstCbCrStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr420ToYCbCr411_8u_P3P2R              :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDstY: ^Npp8u, nDstYStep: c.int, pDstCbCr: ^Npp8u, nDstCbCrStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr420ToYCbCr411_8u_P2P3R_Ctx          :: proc(pSrcY: ^Npp8u, nSrcYStep: c.int, pSrcCbCr: ^Npp8u, nSrcCbCrStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr420ToYCbCr411_8u_P2P3R              :: proc(pSrcY: ^Npp8u, nSrcYStep: c.int, pSrcCbCr: ^Npp8u, nSrcCbCrStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr422_8u_C2P3R_Ctx                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr422_8u_C2P3R                        :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr422_8u_P3C2R_Ctx                    :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr422_8u_P3C2R                        :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr422ToYCrCb422_8u_C2R_Ctx            :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr422ToYCrCb422_8u_C2R                :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr422ToYCrCb422_8u_P3C2R_Ctx          :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr422ToYCrCb422_8u_P3C2R              :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr422ToCbYCr422_8u_C2R_Ctx            :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr422ToCbYCr422_8u_C2R                :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiCbYCr422ToYCbCr411_8u_C2P3R_Ctx          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiCbYCr422ToYCbCr411_8u_C2P3R              :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr422ToYCbCr420_8u_P3R_Ctx            :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr422ToYCbCr420_8u_P3R                :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr422ToYCbCr420_8u_P3P2R_Ctx          :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDstY: ^Npp8u, nDstYStep: c.int, pDstCbCr: ^Npp8u, nDstCbCrStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr422ToYCbCr420_8u_P3P2R              :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDstY: ^Npp8u, nDstYStep: c.int, pDstCbCr: ^Npp8u, nDstCbCrStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr422ToYCbCr420_8u_C2P3R_Ctx          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr422ToYCbCr420_8u_C2P3R              :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr422ToYCbCr420_8u_C2P2R_Ctx          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDstY: ^Npp8u, nDstYStep: c.int, pDstCbCr: ^Npp8u, nDstCbCrStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr422ToYCbCr420_8u_C2P2R              :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDstY: ^Npp8u, nDstYStep: c.int, pDstCbCr: ^Npp8u, nDstCbCrStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCrCb420ToYCbCr422_8u_P3R_Ctx            :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCrCb420ToYCbCr422_8u_P3R                :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCrCb420ToYCbCr422_8u_P3C2R_Ctx          :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCrCb420ToYCbCr422_8u_P3C2R              :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr422ToYCrCb420_8u_C2P3R_Ctx          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr422ToYCrCb420_8u_C2P3R              :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr422ToYCbCr411_8u_P3R_Ctx            :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr422ToYCbCr411_8u_P3R                :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr422ToYCbCr411_8u_P3P2R_Ctx          :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDstY: ^Npp8u, nDstYStep: c.int, pDstCbCr: ^Npp8u, nDstCbCrStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr422ToYCbCr411_8u_P3P2R              :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDstY: ^Npp8u, nDstYStep: c.int, pDstCbCr: ^Npp8u, nDstCbCrStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr422ToYCbCr411_8u_C2P3R_Ctx          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr422ToYCbCr411_8u_C2P3R              :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr422ToYCbCr411_8u_C2P2R_Ctx          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDstY: ^Npp8u, nDstYStep: c.int, pDstCbCr: ^Npp8u, nDstCbCrStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr422ToYCbCr411_8u_C2P2R              :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDstY: ^Npp8u, nDstYStep: c.int, pDstCbCr: ^Npp8u, nDstCbCrStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCrCb422ToYCbCr422_8u_C2P3R_Ctx          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCrCb422ToYCbCr422_8u_C2P3R              :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCrCb422ToYCbCr420_8u_C2P3R_Ctx          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCrCb422ToYCbCr420_8u_C2P3R              :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCrCb422ToYCbCr411_8u_C2P3R_Ctx          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCrCb422ToYCbCr411_8u_C2P3R              :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiCbYCr422ToYCbCr422_8u_C2R_Ctx            :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiCbYCr422ToYCbCr422_8u_C2R                :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiCbYCr422ToYCbCr422_8u_C2P3R_Ctx          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiCbYCr422ToYCbCr422_8u_C2P3R              :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiCbYCr422ToYCbCr420_8u_C2P3R_Ctx          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiCbYCr422ToYCbCr420_8u_C2P3R              :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiCbYCr422ToYCbCr420_8u_C2P2R_Ctx          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDstY: ^Npp8u, nDstYStep: c.int, pDstCbCr: ^Npp8u, nDstCbCrStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiCbYCr422ToYCbCr420_8u_C2P2R              :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDstY: ^Npp8u, nDstYStep: c.int, pDstCbCr: ^Npp8u, nDstCbCrStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiCbYCr422ToYCrCb420_8u_C2P3R_Ctx          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiCbYCr422ToYCrCb420_8u_C2P3R              :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr420_8u_P3P2R_Ctx                    :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDstY: ^Npp8u, nDstYStep: c.int, pDstCbCr: ^Npp8u, nDstCbCrStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr420_8u_P3P2R                        :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDstY: ^Npp8u, nDstYStep: c.int, pDstCbCr: ^Npp8u, nDstCbCrStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr420_8u_P2P3R_Ctx                    :: proc(pSrcY: ^Npp8u, nSrcYStep: c.int, pSrcCbCr: ^Npp8u, nSrcCbCrStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr420_8u_P2P3R                        :: proc(pSrcY: ^Npp8u, nSrcYStep: c.int, pSrcCbCr: ^Npp8u, nSrcCbCrStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr420ToYCbCr422_8u_P3R_Ctx            :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr420ToYCbCr422_8u_P3R                :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr420ToYCbCr422_8u_P2P3R_Ctx          :: proc(pSrcY: ^Npp8u, nSrcYStep: c.int, pSrcCbCr: ^Npp8u, nSrcCbCrStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr420ToYCbCr422_8u_P2P3R              :: proc(pSrcY: ^Npp8u, nSrcYStep: c.int, pSrcCbCr: ^Npp8u, nSrcCbCrStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr420ToYCbCr422_8u_P2C2R_Ctx          :: proc(pSrcY: ^Npp8u, nSrcYStep: c.int, pSrcCbCr: ^Npp8u, nSrcCbCrStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr420ToYCbCr422_8u_P2C2R              :: proc(pSrcY: ^Npp8u, nSrcYStep: c.int, pSrcCbCr: ^Npp8u, nSrcCbCrStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr420ToCbYCr422_8u_P2C2R_Ctx          :: proc(pSrcY: ^Npp8u, nSrcYStep: c.int, pSrcCbCr: ^Npp8u, nSrcCbCrStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr420ToCbYCr422_8u_P2C2R              :: proc(pSrcY: ^Npp8u, nSrcYStep: c.int, pSrcCbCr: ^Npp8u, nSrcCbCrStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr420ToYCrCb420_8u_P2P3R_Ctx          :: proc(pSrcY: ^Npp8u, nSrcYStep: c.int, pSrcCbCr: ^Npp8u, nSrcCbCrStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr420ToYCrCb420_8u_P2P3R              :: proc(pSrcY: ^Npp8u, nSrcYStep: c.int, pSrcCbCr: ^Npp8u, nSrcCbCrStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCrCb420ToCbYCr422_8u_P3C2R_Ctx          :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCrCb420ToCbYCr422_8u_P3C2R              :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCrCb420ToYCbCr420_8u_P3P2R_Ctx          :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDstY: ^Npp8u, nDstYStep: c.int, pDstCbCr: ^Npp8u, nDstCbCrStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCrCb420ToYCbCr420_8u_P3P2R              :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDstY: ^Npp8u, nDstYStep: c.int, pDstCbCr: ^Npp8u, nDstCbCrStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCrCb420ToYCbCr411_8u_P3P2R_Ctx          :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDstY: ^Npp8u, nDstYStep: c.int, pDstCbCr: ^Npp8u, nDstCbCrStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCrCb420ToYCbCr411_8u_P3P2R              :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDstY: ^Npp8u, nDstYStep: c.int, pDstCbCr: ^Npp8u, nDstCbCrStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr411_8u_P3P2R_Ctx                    :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDstY: ^Npp8u, nDstYStep: c.int, pDstCbCr: ^Npp8u, nDstCbCrStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr411_8u_P3P2R                        :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDstY: ^Npp8u, nDstYStep: c.int, pDstCbCr: ^Npp8u, nDstCbCrStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr411_8u_P2P3R_Ctx                    :: proc(pSrcY: ^Npp8u, nSrcYStep: c.int, pSrcCbCr: ^Npp8u, nSrcCbCrStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr411_8u_P2P3R                        :: proc(pSrcY: ^Npp8u, nSrcYStep: c.int, pSrcCbCr: ^Npp8u, nSrcCbCrStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr411ToYCbCr422_8u_P3R_Ctx            :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr411ToYCbCr422_8u_P3R                :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr411ToYCbCr422_8u_P3C2R_Ctx          :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr411ToYCbCr422_8u_P3C2R              :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr411ToYCbCr422_8u_P2P3R_Ctx          :: proc(pSrcY: ^Npp8u, nSrcYStep: c.int, pSrcCbCr: ^Npp8u, nSrcCbCrStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr411ToYCbCr422_8u_P2P3R              :: proc(pSrcY: ^Npp8u, nSrcYStep: c.int, pSrcCbCr: ^Npp8u, nSrcCbCrStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr411ToYCbCr422_8u_P2C2R_Ctx          :: proc(pSrcY: ^Npp8u, nSrcYStep: c.int, pSrcCbCr: ^Npp8u, nSrcCbCrStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr411ToYCbCr422_8u_P2C2R              :: proc(pSrcY: ^Npp8u, nSrcYStep: c.int, pSrcCbCr: ^Npp8u, nSrcCbCrStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr411ToYCrCb422_8u_P3R_Ctx            :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr411ToYCrCb422_8u_P3R                :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr411ToYCrCb422_8u_P3C2R_Ctx          :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr411ToYCrCb422_8u_P3C2R              :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr411ToYCbCr420_8u_P3R_Ctx            :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr411ToYCbCr420_8u_P3R                :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr411ToYCbCr420_8u_P3P2R_Ctx          :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDstY: ^Npp8u, nDstYStep: c.int, pDstCbCr: ^Npp8u, nDstCbCrStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr411ToYCbCr420_8u_P3P2R              :: proc(pSrc: ^[3]cuda.CUdeviceptr, rSrcStep: ^c.int, pDstY: ^Npp8u, nDstYStep: c.int, pDstCbCr: ^Npp8u, nDstCbCrStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr411ToYCbCr420_8u_P2P3R_Ctx          :: proc(pSrcY: ^Npp8u, nSrcYStep: c.int, pSrcCbCr: ^Npp8u, nSrcCbCrStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr411ToYCbCr420_8u_P2P3R              :: proc(pSrcY: ^Npp8u, nSrcYStep: c.int, pSrcCbCr: ^Npp8u, nSrcCbCrStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiYCbCr411ToYCrCb420_8u_P2P3R_Ctx          :: proc(pSrcY: ^Npp8u, nSrcYStep: c.int, pSrcCbCr: ^Npp8u, nSrcCbCrStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiYCbCr411ToYCrCb420_8u_P2P3R              :: proc(pSrcY: ^Npp8u, nSrcYStep: c.int, pSrcCbCr: ^Npp8u, nSrcCbCrStep: c.int, pDst: ^[3]cuda.CUdeviceptr, rDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiNV12ToYUV420_8u_P2P3R_Ctx                :: proc(pSrc: ^[2]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, aDstStep: ^c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiNV12ToYUV420_8u_P2P3R                    :: proc(pSrc: ^[2]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, aDstStep: ^c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiGammaFwd_8u_C3R_Ctx                      :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiGammaFwd_8u_C3R                          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiGammaFwd_8u_C3IR_Ctx                     :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiGammaFwd_8u_C3IR                         :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiGammaFwd_8u_AC4R_Ctx                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiGammaFwd_8u_AC4R                         :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiGammaFwd_8u_AC4IR_Ctx                    :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiGammaFwd_8u_AC4IR                        :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiGammaFwd_8u_P3R_Ctx                      :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiGammaFwd_8u_P3R                          :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiGammaFwd_8u_IP3R_Ctx                     :: proc(pSrcDst: ^^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiGammaFwd_8u_IP3R                         :: proc(pSrcDst: ^^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiGammaInv_8u_C3R_Ctx                      :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiGammaInv_8u_C3R                          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiGammaInv_8u_C3IR_Ctx                     :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiGammaInv_8u_C3IR                         :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiGammaInv_8u_AC4R_Ctx                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiGammaInv_8u_AC4R                         :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiGammaInv_8u_AC4IR_Ctx                    :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiGammaInv_8u_AC4IR                        :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiGammaInv_8u_P3R_Ctx                      :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiGammaInv_8u_P3R                          :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiGammaInv_8u_IP3R_Ctx                     :: proc(pSrcDst: ^^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiGammaInv_8u_IP3R                         :: proc(pSrcDst: ^^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize) -> NppStatus ---
    nppiCompColorKey_8u_C1R_Ctx                  :: proc(pSrc1: ^Npp8u, nSrc1Step: c.int, pSrc2: ^Npp8u, nSrc2Step: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nColorKeyConst: Npp8u, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiCompColorKey_8u_C1R                      :: proc(pSrc1: ^Npp8u, nSrc1Step: c.int, pSrc2: ^Npp8u, nSrc2Step: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nColorKeyConst: Npp8u) -> NppStatus ---
    nppiCompColorKey_8u_C3R_Ctx                  :: proc(pSrc1: ^Npp8u, nSrc1Step: c.int, pSrc2: ^Npp8u, nSrc2Step: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nColorKeyConst: ^Npp8u, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiCompColorKey_8u_C3R                      :: proc(pSrc1: ^Npp8u, nSrc1Step: c.int, pSrc2: ^Npp8u, nSrc2Step: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nColorKeyConst: ^Npp8u) -> NppStatus ---
    nppiCompColorKey_8u_C4R_Ctx                  :: proc(pSrc1: ^Npp8u, nSrc1Step: c.int, pSrc2: ^Npp8u, nSrc2Step: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nColorKeyConst: ^Npp8u, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiCompColorKey_8u_C4R                      :: proc(pSrc1: ^Npp8u, nSrc1Step: c.int, pSrc2: ^Npp8u, nSrc2Step: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nColorKeyConst: ^Npp8u) -> NppStatus ---
    nppiAlphaCompColorKey_8u_AC4R_Ctx            :: proc(pSrc1: ^Npp8u, nSrc1Step: c.int, nAlpha1: Npp8u, pSrc2: ^Npp8u, nSrc2Step: c.int, nAlpha2: Npp8u, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nColorKeyConst: ^Npp8u, nppAlphaOp: NppiAlphaOp, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiAlphaCompColorKey_8u_AC4R                :: proc(pSrc1: ^Npp8u, nSrc1Step: c.int, nAlpha1: Npp8u, pSrc2: ^Npp8u, nSrc2Step: c.int, nAlpha2: Npp8u, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, nColorKeyConst: ^Npp8u, nppAlphaOp: NppiAlphaOp) -> NppStatus ---
    nppiColorTwist32f_8u_C1R_Ctx                 :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_8u_C1R                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_8u_C1IR_Ctx                :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_8u_C1IR                    :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_8u_C2R_Ctx                 :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_8u_C2R                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_8u_C2IR_Ctx                :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_8u_C2IR                    :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_8u_C3R_Ctx                 :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_8u_C3R                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_8u_C3IR_Ctx                :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_8u_C3IR                    :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_8u_C4R_Ctx                 :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_8u_C4R                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_8u_C4IR_Ctx                :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_8u_C4IR                    :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_8u_AC4R_Ctx                :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_8u_AC4R                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_8u_AC4IR_Ctx               :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_8u_AC4IR                   :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32fC_8u_C4R_Ctx                :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, aConstants: ^Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32fC_8u_C4R                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, aConstants: ^Npp32f) -> NppStatus ---
    nppiColorTwist32fC_8u_C4IR_Ctx               :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, aConstants: ^Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32fC_8u_C4IR                   :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, aConstants: ^Npp32f) -> NppStatus ---
    nppiColorTwist32f_8u_P3R_Ctx                 :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_8u_P3R                     :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_8u_IP3R_Ctx                :: proc(pSrcDst: ^^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_8u_IP3R                    :: proc(pSrcDst: ^^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_8s_C1R_Ctx                 :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8s, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_8s_C1R                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8s, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_8s_C1IR_Ctx                :: proc(pSrcDst: ^Npp8s, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_8s_C1IR                    :: proc(pSrcDst: ^Npp8s, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_8s_C2R_Ctx                 :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8s, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_8s_C2R                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8s, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_8s_C2IR_Ctx                :: proc(pSrcDst: ^Npp8s, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_8s_C2IR                    :: proc(pSrcDst: ^Npp8s, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_8s_C3R_Ctx                 :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8s, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_8s_C3R                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8s, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_8s_C3IR_Ctx                :: proc(pSrcDst: ^Npp8s, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_8s_C3IR                    :: proc(pSrcDst: ^Npp8s, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_8s_C4R_Ctx                 :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8s, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_8s_C4R                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8s, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_8s_C4IR_Ctx                :: proc(pSrcDst: ^Npp8s, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_8s_C4IR                    :: proc(pSrcDst: ^Npp8s, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_8s_AC4R_Ctx                :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8s, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_8s_AC4R                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8s, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_8s_AC4IR_Ctx               :: proc(pSrcDst: ^Npp8s, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_8s_AC4IR                   :: proc(pSrcDst: ^Npp8s, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_8s_P3R_Ctx                 :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_8s_P3R                     :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_8s_IP3R_Ctx                :: proc(pSrcDst: ^^Npp8s, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_8s_IP3R                    :: proc(pSrcDst: ^^Npp8s, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_16u_C1R_Ctx                :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_16u_C1R                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_16u_C1IR_Ctx               :: proc(pSrcDst: ^Npp16u, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_16u_C1IR                   :: proc(pSrcDst: ^Npp16u, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_16u_C2R_Ctx                :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_16u_C2R                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_16u_C2IR_Ctx               :: proc(pSrcDst: ^Npp16u, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_16u_C2IR                   :: proc(pSrcDst: ^Npp16u, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_16u_C3R_Ctx                :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_16u_C3R                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_16u_C3IR_Ctx               :: proc(pSrcDst: ^Npp16u, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_16u_C3IR                   :: proc(pSrcDst: ^Npp16u, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_16u_AC4R_Ctx               :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_16u_AC4R                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_16u_AC4IR_Ctx              :: proc(pSrcDst: ^Npp16u, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_16u_AC4IR                  :: proc(pSrcDst: ^Npp16u, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_16u_P3R_Ctx                :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_16u_P3R                    :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_16u_IP3R_Ctx               :: proc(pSrcDst: ^^Npp16u, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_16u_IP3R                   :: proc(pSrcDst: ^^Npp16u, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_16s_C1R_Ctx                :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_16s_C1R                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_16s_C1IR_Ctx               :: proc(pSrcDst: ^Npp16s, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_16s_C1IR                   :: proc(pSrcDst: ^Npp16s, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_16s_C2R_Ctx                :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_16s_C2R                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_16s_C2IR_Ctx               :: proc(pSrcDst: ^Npp16s, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_16s_C2IR                   :: proc(pSrcDst: ^Npp16s, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_16s_C3R_Ctx                :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_16s_C3R                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_16s_C3IR_Ctx               :: proc(pSrcDst: ^Npp16s, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_16s_C3IR                   :: proc(pSrcDst: ^Npp16s, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_16s_AC4R_Ctx               :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_16s_AC4R                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_16s_AC4IR_Ctx              :: proc(pSrcDst: ^Npp16s, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_16s_AC4IR                  :: proc(pSrcDst: ^Npp16s, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_16s_P3R_Ctx                :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_16s_P3R                    :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_16s_IP3R_Ctx               :: proc(pSrcDst: ^^Npp16s, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_16s_IP3R                   :: proc(pSrcDst: ^^Npp16s, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_16f_C1R_Ctx                :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16f, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_16f_C1R                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16f, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_16f_C1IR_Ctx               :: proc(pSrcDst: ^Npp16f, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_16f_C1IR                   :: proc(pSrcDst: ^Npp16f, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_16f_C2R_Ctx                :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16f, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_16f_C2R                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16f, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_16f_C2IR_Ctx               :: proc(pSrcDst: ^Npp16f, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_16f_C2IR                   :: proc(pSrcDst: ^Npp16f, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_16f_C3R_Ctx                :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16f, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_16f_C3R                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16f, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_16f_C3IR_Ctx               :: proc(pSrcDst: ^Npp16f, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_16f_C3IR                   :: proc(pSrcDst: ^Npp16f, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_16f_C4R_Ctx                :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16f, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_16f_C4R                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16f, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32f_16f_C4IR_Ctx               :: proc(pSrcDst: ^Npp16f, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32f_16f_C4IR                   :: proc(pSrcDst: ^Npp16f, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist32fC_16f_C4R_Ctx               :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16f, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, aConstants: ^Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32fC_16f_C4R                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16f, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, aConstants: ^Npp32f) -> NppStatus ---
    nppiColorTwist32fC_16f_C4IR_Ctx              :: proc(pSrcDst: ^Npp16f, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, aConstants: ^Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist32fC_16f_C4IR                  :: proc(pSrcDst: ^Npp16f, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, aConstants: ^Npp32f) -> NppStatus ---
    nppiColorTwist_32f_C1R_Ctx                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist_32f_C1R                       :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist_32f_C1IR_Ctx                  :: proc(pSrcDst: ^Npp32f, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist_32f_C1IR                      :: proc(pSrcDst: ^Npp32f, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist_32f_C2R_Ctx                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist_32f_C2R                       :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist_32f_C2IR_Ctx                  :: proc(pSrcDst: ^Npp32f, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist_32f_C2IR                      :: proc(pSrcDst: ^Npp32f, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist_32f_C3R_Ctx                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist_32f_C3R                       :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist_32f_C3IR_Ctx                  :: proc(pSrcDst: ^Npp32f, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist_32f_C3IR                      :: proc(pSrcDst: ^Npp32f, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist_32f_C4R_Ctx                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist_32f_C4R                       :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist_32f_C4IR_Ctx                  :: proc(pSrcDst: ^Npp32f, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist_32f_C4IR                      :: proc(pSrcDst: ^Npp32f, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist_32f_AC4R_Ctx                  :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist_32f_AC4R                      :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist_32f_AC4IR_Ctx                 :: proc(pSrcDst: ^Npp32f, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist_32f_AC4IR                     :: proc(pSrcDst: ^Npp32f, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist_32fC_C4R_Ctx                  :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, aConstants: ^Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist_32fC_C4R                      :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, aConstants: ^Npp32f) -> NppStatus ---
    nppiColorTwist_32fC_C4IR_Ctx                 :: proc(pSrcDst: ^Npp32f, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, aConstants: ^Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist_32fC_C4IR                     :: proc(pSrcDst: ^Npp32f, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, aConstants: ^Npp32f) -> NppStatus ---
    nppiColorTwist_32f_P3R_Ctx                   :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist_32f_P3R                       :: proc(pSrc: ^[3]cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^[3]cuda.CUdeviceptr, nDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwist_32f_IP3R_Ctx                  :: proc(pSrcDst: ^^Npp32f, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwist_32f_IP3R                      :: proc(pSrcDst: ^^Npp32f, nSrcDstStep: c.int, oSizeROI: NppiSize, aTwist: [^][4]Npp32f) -> NppStatus ---
    nppiColorTwistBatch32f_8u_C1R_Ctx            :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwistBatch32f_8u_C1R                :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int) -> NppStatus ---
    nppiColorTwistBatch32f_8u_C1IR_Ctx           :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwistBatch32f_8u_C1IR               :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int) -> NppStatus ---
    nppiColorTwistBatch32f_8u_C3R_Ctx            :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwistBatch32f_8u_C3R                :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int) -> NppStatus ---
    nppiColorTwistBatch32f_8u_C3IR_Ctx           :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwistBatch32f_8u_C3IR               :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int) -> NppStatus ---
    nppiColorTwistBatch32f_8u_C4R_Ctx            :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwistBatch32f_8u_C4R                :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int) -> NppStatus ---
    nppiColorTwistBatch32f_8u_C4IR_Ctx           :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwistBatch32f_8u_C4IR               :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int) -> NppStatus ---
    nppiColorTwistBatch32f_8u_AC4R_Ctx           :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwistBatch32f_8u_AC4R               :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int) -> NppStatus ---
    nppiColorTwistBatch32f_8u_AC4IR_Ctx          :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwistBatch32f_8u_AC4IR              :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int) -> NppStatus ---
    nppiColorTwistBatch32fC_8u_C4R_Ctx           :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwistBatch32fC_8u_C4R               :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int) -> NppStatus ---
    nppiColorTwistBatch32fC_8u_C4IR_Ctx          :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwistBatch32fC_8u_C4IR              :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int) -> NppStatus ---
    nppiColorTwistBatch_32f_C1R_Ctx              :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwistBatch_32f_C1R                  :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int) -> NppStatus ---
    nppiColorTwistBatch_32f_C1IR_Ctx             :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwistBatch_32f_C1IR                 :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int) -> NppStatus ---
    nppiColorTwistBatch_32f_C3R_Ctx              :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwistBatch_32f_C3R                  :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int) -> NppStatus ---
    nppiColorTwistBatch_32f_C3IR_Ctx             :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwistBatch_32f_C3IR                 :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int) -> NppStatus ---
    nppiColorTwistBatch_32f_C4R_Ctx              :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwistBatch_32f_C4R                  :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int) -> NppStatus ---
    nppiColorTwistBatch_32f_C4IR_Ctx             :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwistBatch_32f_C4IR                 :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int) -> NppStatus ---
    nppiColorTwistBatch_32f_AC4R_Ctx             :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwistBatch_32f_AC4R                 :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int) -> NppStatus ---
    nppiColorTwistBatch_32f_AC4IR_Ctx            :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwistBatch_32f_AC4IR                :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int) -> NppStatus ---
    nppiColorTwistBatch_32fC_C4R_Ctx             :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwistBatch_32fC_C4R                 :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int) -> NppStatus ---
    nppiColorTwistBatch_32fC_C4IR_Ctx            :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwistBatch_32fC_C4IR                :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int) -> NppStatus ---
    nppiColorTwistBatch32f_16f_C1R_Ctx           :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwistBatch32f_16f_C1R               :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int) -> NppStatus ---
    nppiColorTwistBatch32f_16f_C1IR_Ctx          :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwistBatch32f_16f_C1IR              :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int) -> NppStatus ---
    nppiColorTwistBatch32f_16f_C3R_Ctx           :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwistBatch32f_16f_C3R               :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int) -> NppStatus ---
    nppiColorTwistBatch32f_16f_C3IR_Ctx          :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwistBatch32f_16f_C3IR              :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int) -> NppStatus ---
    nppiColorTwistBatch32f_16f_C4R_Ctx           :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwistBatch32f_16f_C4R               :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int) -> NppStatus ---
    nppiColorTwistBatch32f_16f_C4IR_Ctx          :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwistBatch32f_16f_C4IR              :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int) -> NppStatus ---
    nppiColorTwistBatch32fC_16f_C4R_Ctx          :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwistBatch32fC_16f_C4R              :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int) -> NppStatus ---
    nppiColorTwistBatch32fC_16f_C4IR_Ctx         :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiColorTwistBatch32fC_16f_C4IR             :: proc(nMin: Npp32f, nMax: Npp32f, oSizeROI: NppiSize, pBatchList: ^NppiColorTwistBatchCXR, nBatchSize: c.int) -> NppStatus ---
    nppiLUT_8u_C1R_Ctx                           :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32s, pLevels: ^Npp32s, nLevels: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_8u_C1R                               :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32s, pLevels: ^Npp32s, nLevels: c.int) -> NppStatus ---
    nppiLUT_8u_C1IR_Ctx                          :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32s, pLevels: ^Npp32s, nLevels: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_8u_C1IR                              :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32s, pLevels: ^Npp32s, nLevels: c.int) -> NppStatus ---
    nppiLUT_8u_C3R_Ctx                           :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_8u_C3R                               :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_8u_C3IR_Ctx                          :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_8u_C3IR                              :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_8u_C4R_Ctx                           :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_8u_C4R                               :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_8u_C4IR_Ctx                          :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_8u_C4IR                              :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_8u_AC4R_Ctx                          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_8u_AC4R                              :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_8u_AC4IR_Ctx                         :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_8u_AC4IR                             :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_16u_C1R_Ctx                          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32s, pLevels: ^Npp32s, nLevels: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_16u_C1R                              :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32s, pLevels: ^Npp32s, nLevels: c.int) -> NppStatus ---
    nppiLUT_16u_C1IR_Ctx                         :: proc(pSrcDst: ^Npp16u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32s, pLevels: ^Npp32s, nLevels: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_16u_C1IR                             :: proc(pSrcDst: ^Npp16u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32s, pLevels: ^Npp32s, nLevels: c.int) -> NppStatus ---
    nppiLUT_16u_C3R_Ctx                          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_16u_C3R                              :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_16u_C3IR_Ctx                         :: proc(pSrcDst: ^Npp16u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_16u_C3IR                             :: proc(pSrcDst: ^Npp16u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_16u_C4R_Ctx                          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_16u_C4R                              :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_16u_C4IR_Ctx                         :: proc(pSrcDst: ^Npp16u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_16u_C4IR                             :: proc(pSrcDst: ^Npp16u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_16u_AC4R_Ctx                         :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_16u_AC4R                             :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_16u_AC4IR_Ctx                        :: proc(pSrcDst: ^Npp16u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_16u_AC4IR                            :: proc(pSrcDst: ^Npp16u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_16s_C1R_Ctx                          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32s, pLevels: ^Npp32s, nLevels: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_16s_C1R                              :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32s, pLevels: ^Npp32s, nLevels: c.int) -> NppStatus ---
    nppiLUT_16s_C1IR_Ctx                         :: proc(pSrcDst: ^Npp16s, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32s, pLevels: ^Npp32s, nLevels: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_16s_C1IR                             :: proc(pSrcDst: ^Npp16s, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32s, pLevels: ^Npp32s, nLevels: c.int) -> NppStatus ---
    nppiLUT_16s_C3R_Ctx                          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_16s_C3R                              :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_16s_C3IR_Ctx                         :: proc(pSrcDst: ^Npp16s, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_16s_C3IR                             :: proc(pSrcDst: ^Npp16s, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_16s_C4R_Ctx                          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_16s_C4R                              :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_16s_C4IR_Ctx                         :: proc(pSrcDst: ^Npp16s, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_16s_C4IR                             :: proc(pSrcDst: ^Npp16s, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_16s_AC4R_Ctx                         :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_16s_AC4R                             :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_16s_AC4IR_Ctx                        :: proc(pSrcDst: ^Npp16s, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_16s_AC4IR                            :: proc(pSrcDst: ^Npp16s, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_32f_C1R_Ctx                          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32f, pLevels: ^Npp32f, nLevels: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_32f_C1R                              :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32f, pLevels: ^Npp32f, nLevels: c.int) -> NppStatus ---
    nppiLUT_32f_C1IR_Ctx                         :: proc(pSrcDst: ^Npp32f, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32f, pLevels: ^Npp32f, nLevels: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_32f_C1IR                             :: proc(pSrcDst: ^Npp32f, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32f, pLevels: ^Npp32f, nLevels: c.int) -> NppStatus ---
    nppiLUT_32f_C3R_Ctx                          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32f, pLevels: ^^Npp32f, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_32f_C3R                              :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32f, pLevels: ^^Npp32f, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_32f_C3IR_Ctx                         :: proc(pSrcDst: ^Npp32f, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32f, pLevels: ^^Npp32f, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_32f_C3IR                             :: proc(pSrcDst: ^Npp32f, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32f, pLevels: ^^Npp32f, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_32f_C4R_Ctx                          :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32f, pLevels: ^^Npp32f, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_32f_C4R                              :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32f, pLevels: ^^Npp32f, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_32f_C4IR_Ctx                         :: proc(pSrcDst: ^Npp32f, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32f, pLevels: ^^Npp32f, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_32f_C4IR                             :: proc(pSrcDst: ^Npp32f, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32f, pLevels: ^^Npp32f, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_32f_AC4R_Ctx                         :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32f, pLevels: ^^Npp32f, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_32f_AC4R                             :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32f, pLevels: ^^Npp32f, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_32f_AC4IR_Ctx                        :: proc(pSrcDst: ^Npp32f, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32f, pLevels: ^^Npp32f, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_32f_AC4IR                            :: proc(pSrcDst: ^Npp32f, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32f, pLevels: ^^Npp32f, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Linear_8u_C1R_Ctx                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32s, pLevels: ^Npp32s, nLevels: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Linear_8u_C1R                        :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32s, pLevels: ^Npp32s, nLevels: c.int) -> NppStatus ---
    nppiLUT_Linear_8u_C1IR_Ctx                   :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32s, pLevels: ^Npp32s, nLevels: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Linear_8u_C1IR                       :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32s, pLevels: ^Npp32s, nLevels: c.int) -> NppStatus ---
    nppiLUT_Linear_8u_C3R_Ctx                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Linear_8u_C3R                        :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Linear_8u_C3IR_Ctx                   :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Linear_8u_C3IR                       :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Linear_8u_C4R_Ctx                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Linear_8u_C4R                        :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Linear_8u_C4IR_Ctx                   :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Linear_8u_C4IR                       :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Linear_8u_AC4R_Ctx                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Linear_8u_AC4R                       :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Linear_8u_AC4IR_Ctx                  :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Linear_8u_AC4IR                      :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Linear_16u_C1R_Ctx                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32s, pLevels: ^Npp32s, nLevels: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Linear_16u_C1R                       :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32s, pLevels: ^Npp32s, nLevels: c.int) -> NppStatus ---
    nppiLUT_Linear_16u_C1IR_Ctx                  :: proc(pSrcDst: ^Npp16u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32s, pLevels: ^Npp32s, nLevels: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Linear_16u_C1IR                      :: proc(pSrcDst: ^Npp16u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32s, pLevels: ^Npp32s, nLevels: c.int) -> NppStatus ---
    nppiLUT_Linear_16u_C3R_Ctx                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Linear_16u_C3R                       :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Linear_16u_C3IR_Ctx                  :: proc(pSrcDst: ^Npp16u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Linear_16u_C3IR                      :: proc(pSrcDst: ^Npp16u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Linear_16u_C4R_Ctx                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Linear_16u_C4R                       :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Linear_16u_C4IR_Ctx                  :: proc(pSrcDst: ^Npp16u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Linear_16u_C4IR                      :: proc(pSrcDst: ^Npp16u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Linear_16u_AC4R_Ctx                  :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Linear_16u_AC4R                      :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Linear_16u_AC4IR_Ctx                 :: proc(pSrcDst: ^Npp16u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Linear_16u_AC4IR                     :: proc(pSrcDst: ^Npp16u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Linear_16s_C1R_Ctx                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32s, pLevels: ^Npp32s, nLevels: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Linear_16s_C1R                       :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32s, pLevels: ^Npp32s, nLevels: c.int) -> NppStatus ---
    nppiLUT_Linear_16s_C1IR_Ctx                  :: proc(pSrcDst: ^Npp16s, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32s, pLevels: ^Npp32s, nLevels: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Linear_16s_C1IR                      :: proc(pSrcDst: ^Npp16s, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32s, pLevels: ^Npp32s, nLevels: c.int) -> NppStatus ---
    nppiLUT_Linear_16s_C3R_Ctx                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Linear_16s_C3R                       :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Linear_16s_C3IR_Ctx                  :: proc(pSrcDst: ^Npp16s, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Linear_16s_C3IR                      :: proc(pSrcDst: ^Npp16s, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Linear_16s_C4R_Ctx                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Linear_16s_C4R                       :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Linear_16s_C4IR_Ctx                  :: proc(pSrcDst: ^Npp16s, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Linear_16s_C4IR                      :: proc(pSrcDst: ^Npp16s, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Linear_16s_AC4R_Ctx                  :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Linear_16s_AC4R                      :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Linear_16s_AC4IR_Ctx                 :: proc(pSrcDst: ^Npp16s, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Linear_16s_AC4IR                     :: proc(pSrcDst: ^Npp16s, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Linear_32f_C1R_Ctx                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32f, pLevels: ^Npp32f, nLevels: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Linear_32f_C1R                       :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32f, pLevels: ^Npp32f, nLevels: c.int) -> NppStatus ---
    nppiLUT_Linear_32f_C1IR_Ctx                  :: proc(pSrcDst: ^Npp32f, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32f, pLevels: ^Npp32f, nLevels: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Linear_32f_C1IR                      :: proc(pSrcDst: ^Npp32f, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32f, pLevels: ^Npp32f, nLevels: c.int) -> NppStatus ---
    nppiLUT_Linear_32f_C3R_Ctx                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32f, pLevels: ^^Npp32f, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Linear_32f_C3R                       :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32f, pLevels: ^^Npp32f, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Linear_32f_C3IR_Ctx                  :: proc(pSrcDst: ^Npp32f, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32f, pLevels: ^^Npp32f, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Linear_32f_C3IR                      :: proc(pSrcDst: ^Npp32f, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32f, pLevels: ^^Npp32f, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Linear_32f_C4R_Ctx                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32f, pLevels: ^^Npp32f, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Linear_32f_C4R                       :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32f, pLevels: ^^Npp32f, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Linear_32f_C4IR_Ctx                  :: proc(pSrcDst: ^Npp32f, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32f, pLevels: ^^Npp32f, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Linear_32f_C4IR                      :: proc(pSrcDst: ^Npp32f, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32f, pLevels: ^^Npp32f, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Linear_32f_AC4R_Ctx                  :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32f, pLevels: ^^Npp32f, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Linear_32f_AC4R                      :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32f, pLevels: ^^Npp32f, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Linear_32f_AC4IR_Ctx                 :: proc(pSrcDst: ^Npp32f, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32f, pLevels: ^^Npp32f, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Linear_32f_AC4IR                     :: proc(pSrcDst: ^Npp32f, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32f, pLevels: ^^Npp32f, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Cubic_8u_C1R_Ctx                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32s, pLevels: ^Npp32s, nLevels: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Cubic_8u_C1R                         :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32s, pLevels: ^Npp32s, nLevels: c.int) -> NppStatus ---
    nppiLUT_Cubic_8u_C1IR_Ctx                    :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32s, pLevels: ^Npp32s, nLevels: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Cubic_8u_C1IR                        :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32s, pLevels: ^Npp32s, nLevels: c.int) -> NppStatus ---
    nppiLUT_Cubic_8u_C3R_Ctx                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Cubic_8u_C3R                         :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Cubic_8u_C3IR_Ctx                    :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Cubic_8u_C3IR                        :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Cubic_8u_C4R_Ctx                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Cubic_8u_C4R                         :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Cubic_8u_C4IR_Ctx                    :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Cubic_8u_C4IR                        :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Cubic_8u_AC4R_Ctx                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Cubic_8u_AC4R                        :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Cubic_8u_AC4IR_Ctx                   :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Cubic_8u_AC4IR                       :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Cubic_16u_C1R_Ctx                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32s, pLevels: ^Npp32s, nLevels: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Cubic_16u_C1R                        :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32s, pLevels: ^Npp32s, nLevels: c.int) -> NppStatus ---
    nppiLUT_Cubic_16u_C1IR_Ctx                   :: proc(pSrcDst: ^Npp16u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32s, pLevels: ^Npp32s, nLevels: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Cubic_16u_C1IR                       :: proc(pSrcDst: ^Npp16u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32s, pLevels: ^Npp32s, nLevels: c.int) -> NppStatus ---
    nppiLUT_Cubic_16u_C3R_Ctx                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Cubic_16u_C3R                        :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Cubic_16u_C3IR_Ctx                   :: proc(pSrcDst: ^Npp16u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Cubic_16u_C3IR                       :: proc(pSrcDst: ^Npp16u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Cubic_16u_C4R_Ctx                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Cubic_16u_C4R                        :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Cubic_16u_C4IR_Ctx                   :: proc(pSrcDst: ^Npp16u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Cubic_16u_C4IR                       :: proc(pSrcDst: ^Npp16u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Cubic_16u_AC4R_Ctx                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Cubic_16u_AC4R                       :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Cubic_16u_AC4IR_Ctx                  :: proc(pSrcDst: ^Npp16u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Cubic_16u_AC4IR                      :: proc(pSrcDst: ^Npp16u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Cubic_16s_C1R_Ctx                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32s, pLevels: ^Npp32s, nLevels: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Cubic_16s_C1R                        :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32s, pLevels: ^Npp32s, nLevels: c.int) -> NppStatus ---
    nppiLUT_Cubic_16s_C1IR_Ctx                   :: proc(pSrcDst: ^Npp16s, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32s, pLevels: ^Npp32s, nLevels: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Cubic_16s_C1IR                       :: proc(pSrcDst: ^Npp16s, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32s, pLevels: ^Npp32s, nLevels: c.int) -> NppStatus ---
    nppiLUT_Cubic_16s_C3R_Ctx                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Cubic_16s_C3R                        :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Cubic_16s_C3IR_Ctx                   :: proc(pSrcDst: ^Npp16s, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Cubic_16s_C3IR                       :: proc(pSrcDst: ^Npp16s, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Cubic_16s_C4R_Ctx                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Cubic_16s_C4R                        :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Cubic_16s_C4IR_Ctx                   :: proc(pSrcDst: ^Npp16s, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Cubic_16s_C4IR                       :: proc(pSrcDst: ^Npp16s, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Cubic_16s_AC4R_Ctx                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Cubic_16s_AC4R                       :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16s, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Cubic_16s_AC4IR_Ctx                  :: proc(pSrcDst: ^Npp16s, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Cubic_16s_AC4IR                      :: proc(pSrcDst: ^Npp16s, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32s, pLevels: ^^Npp32s, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Cubic_32f_C1R_Ctx                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32f, pLevels: ^Npp32f, nLevels: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Cubic_32f_C1R                        :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32f, pLevels: ^Npp32f, nLevels: c.int) -> NppStatus ---
    nppiLUT_Cubic_32f_C1IR_Ctx                   :: proc(pSrcDst: ^Npp32f, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32f, pLevels: ^Npp32f, nLevels: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Cubic_32f_C1IR                       :: proc(pSrcDst: ^Npp32f, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32f, pLevels: ^Npp32f, nLevels: c.int) -> NppStatus ---
    nppiLUT_Cubic_32f_C3R_Ctx                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32f, pLevels: ^^Npp32f, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Cubic_32f_C3R                        :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32f, pLevels: ^^Npp32f, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Cubic_32f_C3IR_Ctx                   :: proc(pSrcDst: ^Npp32f, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32f, pLevels: ^^Npp32f, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Cubic_32f_C3IR                       :: proc(pSrcDst: ^Npp32f, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32f, pLevels: ^^Npp32f, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Cubic_32f_C4R_Ctx                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32f, pLevels: ^^Npp32f, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Cubic_32f_C4R                        :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32f, pLevels: ^^Npp32f, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Cubic_32f_C4IR_Ctx                   :: proc(pSrcDst: ^Npp32f, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32f, pLevels: ^^Npp32f, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Cubic_32f_C4IR                       :: proc(pSrcDst: ^Npp32f, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32f, pLevels: ^^Npp32f, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Cubic_32f_AC4R_Ctx                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32f, pLevels: ^^Npp32f, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Cubic_32f_AC4R                       :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32f, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32f, pLevels: ^^Npp32f, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Cubic_32f_AC4IR_Ctx                  :: proc(pSrcDst: ^Npp32f, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32f, pLevels: ^^Npp32f, nLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Cubic_32f_AC4IR                      :: proc(pSrcDst: ^Npp32f, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^^Npp32f, pLevels: ^^Npp32f, nLevels: ^c.int) -> NppStatus ---
    nppiLUT_Trilinear_8u_C4R_Ctx                 :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32u, pLevels: ^^Npp8u, aLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Trilinear_8u_C4R                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32u, pLevels: ^^Npp8u, aLevels: ^c.int) -> NppStatus ---
    nppiLUT_Trilinear_8u_AC4R_Ctx                :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32u, pLevels: ^^Npp8u, aLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Trilinear_8u_AC4R                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32u, pLevels: ^^Npp8u, aLevels: ^c.int) -> NppStatus ---
    nppiLUT_Trilinear_8u_AC4IR_Ctx               :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32u, pLevels: ^^Npp8u, aLevels: ^c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUT_Trilinear_8u_AC4IR                   :: proc(pSrcDst: ^Npp8u, nSrcDstStep: c.int, oSizeROI: NppiSize, pValues: ^Npp32u, pLevels: ^^Npp8u, aLevels: ^c.int) -> NppStatus ---
    nppiLUTPalette_8u_C1R_Ctx                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pTable: ^Npp8u, nBitSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUTPalette_8u_C1R                        :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pTable: ^Npp8u, nBitSize: c.int) -> NppStatus ---
    nppiLUTPalette_8u24u_C1R_Ctx                 :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pTable: ^Npp8u, nBitSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUTPalette_8u24u_C1R                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pTable: ^Npp8u, nBitSize: c.int) -> NppStatus ---
    nppiLUTPalette_8u32u_C1R_Ctx                 :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32u, nDstStep: c.int, oSizeROI: NppiSize, pTable: ^Npp32u, nBitSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUTPalette_8u32u_C1R                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32u, nDstStep: c.int, oSizeROI: NppiSize, pTable: ^Npp32u, nBitSize: c.int) -> NppStatus ---
    nppiLUTPalette_8u_C3R_Ctx                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pTables: ^^Npp8u, nBitSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUTPalette_8u_C3R                        :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pTables: ^^Npp8u, nBitSize: c.int) -> NppStatus ---
    nppiLUTPalette_8u_C4R_Ctx                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pTables: ^^Npp8u, nBitSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUTPalette_8u_C4R                        :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pTables: ^^Npp8u, nBitSize: c.int) -> NppStatus ---
    nppiLUTPalette_8u_AC4R_Ctx                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pTables: ^^Npp8u, nBitSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUTPalette_8u_AC4R                       :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pTables: ^^Npp8u, nBitSize: c.int) -> NppStatus ---
    nppiLUTPalette_16u_C1R_Ctx                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, pTable: ^Npp16u, nBitSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUTPalette_16u_C1R                       :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, pTable: ^Npp16u, nBitSize: c.int) -> NppStatus ---
    nppiLUTPalette_16u8u_C1R_Ctx                 :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pTable: ^Npp8u, nBitSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUTPalette_16u8u_C1R                     :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pTable: ^Npp8u, nBitSize: c.int) -> NppStatus ---
    nppiLUTPalette_16u24u_C1R_Ctx                :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pTable: ^Npp8u, nBitSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUTPalette_16u24u_C1R                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pTable: ^Npp8u, nBitSize: c.int) -> NppStatus ---
    nppiLUTPalette_16u32u_C1R_Ctx                :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32u, nDstStep: c.int, oSizeROI: NppiSize, pTable: ^Npp32u, nBitSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUTPalette_16u32u_C1R                    :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp32u, nDstStep: c.int, oSizeROI: NppiSize, pTable: ^Npp32u, nBitSize: c.int) -> NppStatus ---
    nppiLUTPalette_16u_C3R_Ctx                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, pTables: ^^Npp16u, nBitSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUTPalette_16u_C3R                       :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, pTables: ^^Npp16u, nBitSize: c.int) -> NppStatus ---
    nppiLUTPalette_16u_C4R_Ctx                   :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, pTables: ^^Npp16u, nBitSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUTPalette_16u_C4R                       :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, pTables: ^^Npp16u, nBitSize: c.int) -> NppStatus ---
    nppiLUTPalette_16u_AC4R_Ctx                  :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, pTables: ^^Npp16u, nBitSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUTPalette_16u_AC4R                      :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, pTables: ^^Npp16u, nBitSize: c.int) -> NppStatus ---
    nppiLUTPaletteSwap_8u_C3A0C4R_Ctx            :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, nAlphaValue: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pTables: ^^Npp8u, nBitSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUTPaletteSwap_8u_C3A0C4R                :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, nAlphaValue: c.int, pDst: ^Npp8u, nDstStep: c.int, oSizeROI: NppiSize, pTables: ^^Npp8u, nBitSize: c.int) -> NppStatus ---
    nppiLUTPaletteSwap_16u_C3A0C4R_Ctx           :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, nAlphaValue: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, pTables: ^^Npp16u, nBitSize: c.int, nppStreamCtx: NppStreamContext) -> NppStatus ---
    nppiLUTPaletteSwap_16u_C3A0C4R               :: proc(pSrc: cuda.CUdeviceptr, nSrcStep: c.int, nAlphaValue: c.int, pDst: ^Npp16u, nDstStep: c.int, oSizeROI: NppiSize, pTables: ^^Npp16u, nBitSize: c.int) -> NppStatus ---
}