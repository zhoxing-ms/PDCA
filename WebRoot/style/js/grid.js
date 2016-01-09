// Apply the theme
var highchartsOptions = Highcharts.setOptions(Highcharts.theme);

//汉化图表菜单
Highcharts.setOptions({
    lang: {
        contextButtonTitle: "图表菜单",
        printChart: "打印图片",
        downloadJPEG: "下载JPEG 图片",
        downloadPDF: "下载PDF文档",
        downloadPNG: "下载PNG 图片",
        downloadSVG: "下载SVG 矢量图",
        exportButtonTitle: "导出图片"
    }
});