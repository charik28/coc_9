const server1Url = "http://localhost:8080";


// ⬇ بيانات محاكاة من الـ API (printVoPram)
const printVoConst = {
  dt: "2025-08-28",
  brqSpsList: [
    {
      rprtRefNo: "BRQ001",
      rprtTpCd: "الحجوزات النوعية",
      orgnCd: "308000000",
      rprtInfNtr: "تهريب مخدرات",
      rprtInfDttm: "2025-08-20 12:30",
      rprtInfPlc: "الحدود الغربية",
      cagValTtl: 200000,
      rprtInfPrcd: "إجراءات قانونية",
      rprtInfJrdqTxt: "المادة 12 من القانون"
    }
  ],
  brqOtsList: [
    {
      rprtRefNo: "BRQ002",
      rprtTpCd: "الحجوزات الأخرى",
      orgnCd: "307000000",
      rprtInfNtr: "سجائر مهربة",
      rprtInfDttm: "2025-08-21 10:00",
      rprtInfPlc: "ميناء الجزائر",
      cagValTtl: 50000,
      rprtInfPrcd: "مصادرة",
      rprtInfJrdqTxt: "المادة 5 من القانون"
    }
  ],
  brqIncList: [
    {
      rprtIncRefNo: "INC001",
      rprtIncTtl: "حادث سير",
      rprtIncDesc: "اصطدام مركبتين لنقل بضائع",
      rprtIncDttm: "2025-08-22 14:00",
      orgnCd: "306000000"
    }
  ]
};

function render(printVo) {
  if (!printVo)
    printVo = printVoConst;

  // const cocReport2 = printVo.cocReportDto2;

  const container = document.getElementById("report-container");
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
      </div>

    </h5>
    <div class='section'>
      <div >
        السيد اللواء، المدير العام للجمارك
      </div>
      </div>
    </div>
</div>
</div>
`

  document.getElementById("report-date").textContent = `التاريخ: ${printVo.t0Dttm || "-"}`;

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
  section.innerHTML =`<h2 style="color: darkred">${title}</h2>`;

  var orgnindx=1;
  for (const listElement of list) {

    console.error(listElement)
    section.innerHTML += `
            <h5><u> <b>${orgnindx} - ${t1Orgn} </b> </u></u>
             ${listElement.orgnNm}
            </h5>
            <h5> <u> <b>${t2InfNature} </b>  </u>${listElement.t2InfNature}</h5>
            <h5> <u> <b>${t4Emplacment} </b>  </u>${listElement.t4Emplacement}</h5>
            <h5> <u> <b>${t4Dttm} </b>  </u>${listElement.t4Dttm}</h5>
            <h5> <u> <b>${t5TypeMarchandise} </b>  </u>${listElement.t5TypeMarchandise}</h5>
            <h5> <u> <b>${t6TransportMarchandis} </b>  </u>${listElement.t6TransportMarchandis}</h5>
            <h5> <u> <b>${t6TransportValue} </b> </u>${listElement.t6TransportValue}</h5>
            <h5> <u> <b>${t7DetectionTechnology} </b> </u>${listElement.t7DetectionTechnology}</h5>
            <h5> <u> <b>${t8Personne} </b> </u>${listElement.t8Personne}</h5>
            <h5> <u> <b>${t9InractionValue} </b> </u>${listElement.t9InractionValue}</h5>
            <h5> <u> <b>${t10Loitxt} </b> </u>${listElement.t10Loitxt}</h5>
            <h5> <u> <b>${t11ActionsTaken} </b> </u>${listElement.t11ActionsTaken}</h5>
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


async function brq1_bntsearch_click() {

  console.debug('brq1_bntsearch_click')
  try {
    // 1️⃣ Construire la requête (tu peux ajouter params du formulaire ici)
    // const url = "/api/coc/reports";
    const url =server1Url+ "/api/coc/print-test";

    // 2️⃣ Fetch API
    const response = await fetch(url, {
      method: "GET",
      // headers: {"Content-Type": "application/json"}
    });

    if (!response.ok) {
      throw new Error("Erreur API: " + response.status);
    }

    const printVo = await response.json();
    console.log("Résultats reçus:", printVo);

    // Combine the lists
    const brqCombinedList = [...printVo.brqSpsList, ...printVo.brqIncList, ...printVo.brqOtsList];

    // 3️⃣ Injecter les résultats dans jsGrid
    $("#brq1_results_grid").jsGrid({
      width: "100%",
      height: "400px",

      inserting: false,
      editing: false,
      sorting: true,
      paging: true,

      data: brqCombinedList,

      fields: [
        {name: "orgnNm", title: "N° Réf", type: "text", width: 150},
        {name: "t2InfNature", title: "Code org.", type: "text", width: 80},
        {name: "t4Emplacement", title: "Type", type: "text", width: 70},
        {name: "t4Dttm", title: "Date", type: "text", width: 120},
        {name: "t5TypeMarchandise", title: "Nature", type: "text", width: 200},
        {name: "t6ValueMarchandise", title: "État", type: "text", width: 100},
        {name: "t6TransportMarchandis", title: "État2", type: "text", width: 100}
      ]
    });

    // 4️⃣ Appeler la fonction render() pour préparer l’impression

    render(printVo.brqSpsList);

  } catch (err) {
    console.error("Erreur lors du fetch des rapports:", err);
    alert("Impossible de charger les rapports.");
  }
}

brq1_bntsearch_click()
