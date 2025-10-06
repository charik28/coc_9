package alpass.ipt.coc.rprt.vo.dto;

public class HtmlUtils {

    public static final String HEAD=
           """
           <!DOCTYPE html>");
            <html>
            <head>
              <meta charset="utf-8">
                      <meta name="viewport" content="width=device-width, initial-scale=1">
                      <title>Coc BRQ Report</title>
           """ ;

    public static final String A4CSS=
            """
                <style type="text/css">
                /* A4 Page Style */
                @media print {
                  @page {
                    size: A4;
                    margin: 20mm; /* Set margins for A4 */
                  }
                
                  #report-parent-container {
                    width: 210mm; /* A4 width */
                    height: 297mm; /* A4 height */
                    border: 1px solid #000; /* Outer border */
                    padding: 10mm; /* Padding inside the container */
                    box-sizing: border-box; /* Include padding in width/height */
                    direction: rtl !important; /* Force RTL direction */
                    text-align: right !important; /* Force text alignment */
                  }
                
                  #report-container {
                    border: 1px solid #000; /* Inner border */
                    padding: 10mm; /* Padding inside the report container */
                    box-sizing: border-box; /* Include padding in width/height */
                    height: calc(100% - 20mm); /* Adjust height to fit within parent */
                    overflow: auto; /* Allow scrolling if content overflows */
                    direction: rtl !important; /* Force RTL direction */
                    text-align: right !important; /* Force text alignment */
                  }
                }
                
                /* Optional: Styles for screen view */
                #report-parent-container {
                  width: 100%;
                  max-width: 210mm;
                  margin: 0 auto; /* Center the container */
                  border: 1px solid #000; /* Outer border */
                  direction: rtl; /* Ensure RTL direction */
                  text-align: right; /* Ensure text alignment */
                }
                
                #report-container {
                  border: 1px solid #000; /* Inner border */
                  padding: 20px; /* Padding inside the report */
                  box-sizing: border-box; /* Include padding in width/height */
                  height: auto; /* Allow height to expand */
                  direction: rtl; /* Ensure RTL direction */
                  text-align: right; /* Ensure text alignment */
                }
                #report-parent-container h1 {
                  text-align: center;
                  margin: 0;
                }
                
                #report-parent-container h2 {
                  text-align: right;
                  margin: 10px 0;
                }
                
                #report-parent-container .section {
                  margin-top: 20px;
                }
                
                #report-parent-container .section-title {
                  font-weight: bold;
                  border-bottom: 2px solid #fff;
                  padding-bottom: 5px;
                  margin-bottom: 10px;
                }
                .rtl-box
                {
                    direction: rtl;
                    text-align: right; /* optional, makes text flush right */
                    border: 1px solid #ccc;
                    padding: 8px;  direction: rtl;
                    text-align: right; /* optional, makes text flush right */
                    border: 1px solid #ccc;
                    padding: 8px;
                }
                </style>
                </head>
                """;
}
