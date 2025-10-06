const server1BaseUrl = "http://localhost:8080";


// ⬇ بيانات محاكاة من الـ API (printVoPram)
const printVoConst =
  {
    "t0Dttm": "يومي 03 و04 سبتمبر 2025",
    "brqSpsList": [{
      "brqType": "01",
      "t1ReportNature": null,
      "orgnNm": ": الفرقة المتعددة المهام للجمارك بالبويرة بالتنسيق مع مصلحة الوقاية وأمن الجيش بالبويرة.",
      "t2InfNature": "حيازة بضاعة محظورة متمثلة في مؤثرات عقلية، أجنبية المنشأ (نيجيريا(، مزدوجة الإمضاء من نوع: بريغابالين 300 ملغ.",
      "t4Emplacement": ": الطريق السيار شرق – غرب، بالمنطقة المسماة \"الأخضرية\"، أمام ثكنة الجيش الوطني الشعبي بإتجاه الجزائر.     ",
      "t4Dttm": ": 02/09/2025 على الساعة 22:20 ليلا. ",
      "t5TypeMarchandise": "8850 قرص مهلوس من نوع بريغابالين 300 ملغ.",
      "t6ValueMarchandise": "لم تحدد.",
      "t6TransportMarchandis": "سيارة من نوعفولكس فاغن، تحمل لوحة الترقيم: 12686-107-16، الرقم التسلسلي في الطراز:WVGZZZ1TZ7W079016، ملك للمدعومنسل عائدة.  :.",
      "t6TransportValue": "لم تحدد. ",
      "t7DetectionTechnology": "سد جمارك مع مصالح الوقاية وأمن الجيش بالبويرة، حيث وجدت الأقراص المهلوسة مخبأة بأحكام بالعجلة الاحتياطية وكمية أخرى تحتي المقاعد الخلفية للسيارة.",
      "t8Personne": "المدعو: منسل صدامالمولود بتاريخ: : 28/01/1991 بتبسةمتزوج",
      "t9InractionValue": null,
      "t10Loitxt": "المواد 21 – 336 من قانون الجمارك ومواد الأمر 05-06 المتعلق بمكافحة التهريب. ",
      "t11ActionsTaken": ": تحرير محضر الحجز ضد المخالف.",
      "reportInfoNature": null,
      "reportInfoDateTime": null,
      "reportInfoPlace": null,
      "reportInfoTech": null,
      "reportInfoPrice": null,
      "reportInfoAmount": null,
      "currencyCode": null,
      "reportInfoDescription": null,
      "attachmentFileId": null,
      "totalValue": null,
      "validityStatus": null,
      "operationRefNo": null,
      "unknownYn": null,
      "changeReason": null
    }, {
      "brqType": "01",
      "t1ReportNature": null,
      "orgnNm": "المديرية الجهوية للجمارك بورقلة :",
      "t2InfNature": "حيازة بضاعة محظورة متمثلة في مؤثرات عقلية، أجنبية المنشأ (نيجيريا(، مزدوجة الإمضاء من نوع: بريغابالين 300 ملغ.",
      "t4Emplacement": ": الطريق السيار شرق – غرب، بالمنطقة المسماة \"الأخضرية\"، أمام ثكنة الجيش الوطني الشعبي بإتجاه الجزائر.     ",
      "t4Dttm": ": 02/09/2025 على الساعة 22:20 ليلا. ",
      "t5TypeMarchandise": "8850 قرص مهلوس من نوع بريغابالين 300 ملغ.",
      "t6ValueMarchandise": "لم تحدد.",
      "t6TransportMarchandis": "سيارة من نوعفولكس فاغن، تحمل لوحة الترقيم: 12686-107-16، الرقم التسلسلي في الطراز:WVGZZZ1TZ7W079016، ملك للمدعومنسل عائدة.  :.",
      "t6TransportValue": "لم تحدد. ",
      "t7DetectionTechnology": "سد جمارك مع مصالح الوقاية وأمن الجيش بالبويرة، حيث وجدت الأقراص المهلوسة مخبأة بأحكام بالعجلة الاحتياطية وكمية أخرى تحتي المقاعد الخلفية للسيارة.",
      "t8Personne": "المدعو: منسل صدامالمولود بتاريخ: : 28/01/1991 بتبسةمتزوج",
      "t9InractionValue": null,
      "t10Loitxt": "المواد 21 – 336 من قانون الجمارك ومواد الأمر 05-06 المتعلق بمكافحة التهريب. ",
      "t11ActionsTaken": ": تحرير محضر الحجز ضد المخالف.",
      "reportInfoNature": null,
      "reportInfoDateTime": null,
      "reportInfoPlace": null,
      "reportInfoTech": null,
      "reportInfoPrice": null,
      "reportInfoAmount": null,
      "currencyCode": null,
      "reportInfoDescription": null,
      "attachmentFileId": null,
      "totalValue": null,
      "validityStatus": null,
      "operationRefNo": null,
      "unknownYn": null,
      "changeReason": null
    }, {
      "brqType": "01",
      "t1ReportNature": null,
      "orgnNm": "المديرية الجهوية للجمارك بالجزائر خارجية :",
      "t2InfNature": "حيازة بضاعة محظورة متمثلة في مؤثرات عقلية، أجنبية المنشأ (نيجيريا(، مزدوجة الإمضاء من نوع: بريغابالين 300 ملغ.",
      "t4Emplacement": ": الطريق السيار شرق – غرب، بالمنطقة المسماة \"الأخضرية\"، أمام ثكنة الجيش الوطني الشعبي بإتجاه الجزائر.     ",
      "t4Dttm": ": 02/09/2025 على الساعة 22:20 ليلا. ",
      "t5TypeMarchandise": "8850 قرص مهلوس من نوع بريغابالين 300 ملغ.",
      "t6ValueMarchandise": "لم تحدد.",
      "t6TransportMarchandis": "سيارة من نوعفولكس فاغن، تحمل لوحة الترقيم: 12686-107-16، الرقم التسلسلي في الطراز:WVGZZZ1TZ7W079016، ملك للمدعومنسل عائدة.  :.",
      "t6TransportValue": "لم تحدد. ",
      "t7DetectionTechnology": "سد جمارك مع مصالح الوقاية وأمن الجيش بالبويرة، حيث وجدت الأقراص المهلوسة مخبأة بأحكام بالعجلة الاحتياطية وكمية أخرى تحتي المقاعد الخلفية للسيارة.",
      "t8Personne": "المدعو: منسل صدامالمولود بتاريخ: : 28/01/1991 بتبسةمتزوج",
      "t9InractionValue": null,
      "t10Loitxt": "المواد 21 – 336 من قانون الجمارك ومواد الأمر 05-06 المتعلق بمكافحة التهريب. ",
      "t11ActionsTaken": ": تحرير محضر الحجز ضد المخالف.",
      "reportInfoNature": null,
      "reportInfoDateTime": null,
      "reportInfoPlace": null,
      "reportInfoTech": null,
      "reportInfoPrice": null,
      "reportInfoAmount": null,
      "currencyCode": null,
      "reportInfoDescription": null,
      "attachmentFileId": null,
      "totalValue": null,
      "validityStatus": null,
      "operationRefNo": null,
      "unknownYn": null,
      "changeReason": null
    }, {
      "brqType": "01",
      "t1ReportNature": null,
      "orgnNm": " المديرية الجهوية للجمارك بتبسة :",
      "t2InfNature": "حيازة بضاعة محظورة متمثلة في مؤثرات عقلية، أجنبية المنشأ (نيجيريا(، مزدوجة الإمضاء من نوع: بريغابالين 300 ملغ.",
      "t4Emplacement": ": الطريق السيار شرق – غرب، بالمنطقة المسماة \"الأخضرية\"، أمام ثكنة الجيش الوطني الشعبي بإتجاه الجزائر.     ",
      "t4Dttm": ": 02/09/2025 على الساعة 22:20 ليلا. ",
      "t5TypeMarchandise": "8850 قرص مهلوس من نوع بريغابالين 300 ملغ.",
      "t6ValueMarchandise": "لم تحدد.",
      "t6TransportMarchandis": "سيارة من نوعفولكس فاغن، تحمل لوحة الترقيم: 12686-107-16، الرقم التسلسلي في الطراز:WVGZZZ1TZ7W079016، ملك للمدعومنسل عائدة.  :.",
      "t6TransportValue": "لم تحدد. ",
      "t7DetectionTechnology": "سد جمارك مع مصالح الوقاية وأمن الجيش بالبويرة، حيث وجدت الأقراص المهلوسة مخبأة بأحكام بالعجلة الاحتياطية وكمية أخرى تحتي المقاعد الخلفية للسيارة.",
      "t8Personne": "المدعو: منسل صدامالمولود بتاريخ: : 28/01/1991 بتبسةمتزوج",
      "t9InractionValue": null,
      "t10Loitxt": "المواد 21 – 336 من قانون الجمارك ومواد الأمر 05-06 المتعلق بمكافحة التهريب. ",
      "t11ActionsTaken": ": تحرير محضر الحجز ضد المخالف.",
      "reportInfoNature": null,
      "reportInfoDateTime": null,
      "reportInfoPlace": null,
      "reportInfoTech": null,
      "reportInfoPrice": null,
      "reportInfoAmount": null,
      "currencyCode": null,
      "reportInfoDescription": null,
      "attachmentFileId": null,
      "totalValue": null,
      "validityStatus": null,
      "operationRefNo": null,
      "unknownYn": null,
      "changeReason": null
    }],
    "brqOtsList": [],
    "brqIncList": []
  };

function render(printVo) {
  if (!printVo)
    printVo = printVoConst;

  // const cocReport2 = printVo.cocReportDto2;

  const container = document.getElementById("docContent");
  // const viewMode = document.getElementById("viewMode").value;
  container.innerHTML = ""; // reset

  container.innerHTML +=
    `
  <div class='container'>
  <div style='text-align: center'>
    <h4>الجمهورية الجزائرية الديمقراطية الشعبية</h4>
    <h4>وزارة المالية</h4>
    <h4>المديرية العامة للجمارك</h4>
    <h4>مديرية الأمن والنشاط العملياتي للفرق</h4>
    <h3>كشف الاستعلامات اليومي</h3>
      <div style="text-align: left">

    <h5>الجزائر، في:
        ${printVo.t0Dttm}
    </h5>

      </div>

    <div class='section'>
      <div >
        السيد اللواء، المدير العام للجمارك
      </div>
      </div>
    </div>
</div>
</div>
`

  // document.getElementById("report-date").textContent = `التاريخ: ${printVo.t0Dttm || "-"}`;

  // SPS
  if (printVo.brqSpsList?.length) {
    console.debug('brqSpsList.length=', printVo.brqSpsList?.length)

    renderSection(container, "I – الحجوزات النوعية", printVo.brqSpsList, "rprt");
  }

  // OTS
  if (printVo.brqOtsList?.length) {
    renderSection(container, "II – الحجوزات الأخرى", printVo.brqOtsList, "rprt");
  }

  // INC
  if (printVo.brqIncList?.length) {
    renderSection(container, "III – الأحداث", printVo.brqIncList, "inc");
  }
}

function renderSection(container, title, list) {

  console.debug('start rendring ...')
  const t1Orgn = 'المصلحة المعاينة للمخالفة:'

  const t2InfNature = 'طبيعة المخالفة: ';
  const t4Emplacment = 'مكان اكتشاف المخالفة: ';
  const t4Dttm = 'التاريخ والساعة: ';
  const t5TypeMarchandise = 'تعيين البضاعة محل الغش:';

  const t6TransportMarchandis = 'وسيلة النقل المستعملة:';

  const t6TransportValue = 'قيمة وسيلة النقل المستعملة:';
  const t7DetectionTechnology = "تقنية الكشف عن المخالفة:";

  const t8Personne = "البيانات المتعلقة بالأشخاص المسؤولين عن المخالفة: ";
  const t9InractionValue = "قيمة الغرامة المستحقة: "
  const t10Loitxt = "النصوص القانونية المجرمة والردعية: "

  const t11ActionsTaken = "الإجراءات المتخذة:"
  // const
  // const

  const section = document.createElement("div");
  section.className = "report-section";

  console.log(list)
  section.innerHTML = `<h2 style="color: darkred">${title}</h2>`;

  var orgnindx = 1;
  for (const listElement of list) {

    console.error(listElement)
    section.innerHTML += `
            <h5><u> <b>${orgnindx} - ${t1Orgn} </b> </u></u>
             ${listElement.orgnNm}
            </h5>
            <h5> <u> <b>${t2InfNature} </b>  </u>${listElement.rprtInfNtr}</h5>
            <h5> <u> <b>${t4Emplacment} </b>  </u>${listElement.rprtInfPlc}</h5>
            <h5> <u> <b>${t4Dttm} </b>  </u>${listElement.rprtInfDttm}</h5>
            <h5> <u> <b>${t5TypeMarchandise} </b>  </u>${listElement.t5TypeMarchandise}</h5>
            <h5> <u> <b>${t6TransportMarchandis} </b>  </u>${listElement.t6TransportMarchandis}</h5>
            <h5> <u> <b>${t6TransportValue} </b> </u>${listElement.t6TransportValue}</h5>
            <h5> <u> <b>${t7DetectionTechnology} </b> </u>${listElement.rprtInfTch}</h5>
            <h5> <u> <b>${t8Personne} </b> </u>${listElement.t8Personne}</h5>
            <h5> <u> <b>${t9InractionValue} </b> </u>${listElement.cagValTtl}</h5>
            <h5> <u> <b>${t10Loitxt} </b> </u>${listElement.rprInfJrdqTxt}</h5>
            <h5> <u> <b>${t11ActionsTaken} </b> </u>${listElement.rprtIntPRcd}</h5>
`
    ;
    orgnindx++;
  }

  // section.appendChild(div);

  container.appendChild(section);
}

// Init
//  render();

// todo

/*function jsGridTemplate(value) {

  if (value === "01" || value==="Spc" ) {
    return '<span class="badge badge-success">' + value + '</span>';
  } else if (value === "Annulé") {
    return '<span class="badge badge-danger">' + value + '</span>';
  } else {
    return value; // Default rendering for other statuses
  }
}*/
function formatDate(d) {
  const date = new Date(d);
  const day = String(date.getDate()).padStart(2, "0");
  const month = String(date.getMonth() + 1).padStart(2, "0"); // JS months are 0-based
  const year = date.getFullYear();
  return `${day}/${month}/${year}`;
}
async function brq1_bntsearch_click(event) {
/*
 // todo can i add this as reqeust body
  console.debug('brq1_bntsearch_click')
  try {
    // 1️⃣ Construire la requête (tu peux ajouter params du formulaire ici)
    // const url = "/api/coc/reports";

    if (event)
      event.preventDefault(); // Prevent the form from submitting
*/
    // Gather form data
    const serviceCode = document.getElementById('serviceCode')?.value;
    const orderService = document.getElementById('orderService')?.value;
    const operationTitle = document.getElementById('operationTitle')?.value;
    const operationType = document.getElementById('operationType')?.value;
    const operationStatus = document.getElementById('operationStatus')?.value;
    const operationDate1 = document.getElementById('operationDate1')?.value;
    const operationDate2 = document.getElementById('operationDate2')?.value;

    const requestBody = {
      vldtStts: operationStatus || "",
      orgnCd: serviceCode || "",
      srchVldtStts: operationType || "",
      srchRprtTpCd: orderService || "",
      srchOrgnCd: operationTitle || "",
      srchRprtInfNtr: "", // not mapped in your original vars, left empty
      rprtRqstDtFrom: operationDate1 || formatDate(new Date(Date.now() - 2400 * 60 * 60 * 1000).toISOString()),
      rprtRqstDtTo: operationDate2 ||  formatDate(new Date().toISOString())
    };



// Define URL without query params
  let printVo;

    try {
      // const url = `${server1BaseUrl}/api/coc/reports`;
      const url = `${server1BaseUrl}/coc/rprt/printReportBrqGlobalHtml`;
    // Fetch API call
      const response = await fetch(url, {
        method: "POST",
        headers: {"Content-Type": "application/json"},
         body: JSON.stringify(requestBody)
      })
      printVo = await response.json();

        if (!response.ok) {
          console.error(" no Résultats reçus:");

          printVo = printVoConst;
          // throw new Error("Erreur API: " + response.status);
        }

    }catch (e){
      printVo = printVoConst
      console.error("  Résultats de test only:", printVo);
    }

    render(printVo);

}

brq1_bntsearch_click()
