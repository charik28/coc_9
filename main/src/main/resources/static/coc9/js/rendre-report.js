// ⬇ بيانات محاكاة من الـ API (printVoPram)
const printVo = {
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

function render(cocReport2) {
  if(!cocReport2)
    cocReport2 = printVo;

  const container = document.getElementById("report-container");
  const viewMode = document.getElementById("viewMode").value;
  container.innerHTML = ""; // reset

  container.innerHTML +=
    "<div class='container'>\n" +
    "        <h1>الجمهورية الجزائرية الديمقراطية الشعبية</h1>\n" +
    "        <h2>وزارة المالية</h2>\n" +
    "        <h2>المديرية العامة للجمارك</h2>\n" +
    "        <h2>مديرية الأمن والنشاط العملياتي للفرق</h2>\n" +
    "        <h2>كشف الاستعلامات اليومي</h2>\n" +
    "        <h2>الجزائر، في: 04 سبتمبر 2025</h2>\n" +
    "        \n" +
    "        <div class='section'>\n" +
    "            <div class='section-title'>السيد اللواء، المدير العام للجمارك</div>\n" +
    "            <div>كشف الاستعلامات اليومي</div>\n" +
    "            <div>يومي 03 و04 سبتمبر 2025</div>\n" +
    "        </div>\n" +
    "    </div>" +
    ""
  document.getElementById("report-date").textContent = `التاريخ: ${cocReport2.dt || "-"}`;

  // SPS
  if (cocReport2.brqSpsList?.length) {
    renderSection(container, "I – الحجوزات النوعية", cocReport2.brqSpsList, "rprt", viewMode);
  }

  // OTS
  if (cocReport2.brqOtsList?.length) {
    renderSection(container, "II – الحجوزات الأخرى", cocReport2.brqOtsList, "rprt", viewMode);
  }

  // INC
  if (cocReport2.brqIncList?.length) {
    renderSection(container, "III – الأحداث", cocReport2.brqIncList, "inc", viewMode);
  }
}

function renderSection(container, title, list, type, viewMode) {

  const t1Orgn = 'المصلحة المعاينة للمخالفة:'
   const orgnNm ='الفرقة المتعددة المهام للجمارك بالبويرة بالتنسيق مع مصلحة الوقاية وأمن الجيش بالبويرة.'

  const t2Nature='طبيعة المخالفة: ';
  const t4Emplacment = 'مكان اكتشاف المخالفة: ';
  const t4Dttm = '02/09/2025 على الساعة 22:20 ليلا.  ';
  const t5TypeMarchandise = 'تعيين البضاعة محل الغش:';

  const t6TransportMarchandise = 'وسيلة النقل المستعملة:';

  const t6TransportValue = 'قيمة وسيلة النقل المستعملة:';
  const t7DetectionTechnology ="تقنية الكشف عن المخالفة:";

  const t8Personne = "البيانات المتعلقة بالأشخاص المسؤولين عن المخالفة: ";
  const t9InractionValue ="قيمة الغرامة المستحقة: "
  const t10Loitxt = "النصوص القانونية المجرمة والردعية: "

  const t11ActionsTaken = "الإجراءات المتخذة:"
  // const
  // const

  const section = document.createElement("div");
  section.className = "report-section";
  section.innerHTML = ` <h2>${title}</h2>
            <h2> <b>${t1Orgn} </b>
            ${orgnNm}
            </h2>
            <h2> <b>${t2Nature} </b>${list.t3Emplacement}</h2>
            <h5> <b>${t4Emplacment} </b>${list.t3Emplacement}</h5>
            <h5> <b>${t4Dttm} </b>${list.t4Dttm}</h5>
            <h5> <b>${t5TypeMarchandise} </b>${list.t5TypeMarchandise}</h5>
            <h5> <b>${t6TransportMarchandise} </b>${list.t6TransportMarchandise}</h5>
            <h5> <b>${t6TransportValue} </b>${list.t6TransportValue}</h5>
            <h5> <b>${t7DetectionTechnology} </b>${list.t7DetectionTechnology}</h5>
            <h5> <b>${t8Personne} </b>${list.t8Personne}</h5>
            <h5> <b>${t9InractionValue} </b>${list.t9InractionValue}</h5>
            <h5> <b>${t10Loitxt} </b>${list.t10Loitxt}</h5>
            <h5> <b>${t11ActionsTaken} </b>${list.t11ActionsTaken}</h5>
`
  ;

  if (viewMode === "table") {
    const table = document.createElement("table");
    const thead = document.createElement("thead");
    const tbody = document.createElement("tbody");

    if (type === "rprt") {
      thead.innerHTML = `<tr><th>المرجع</th><th>النوع</th><th>الفرقة</th><th>الوصف</th><th>التاريخ</th><th>المكان</th><th>القيمة</th></tr>`;
      list.forEach(item => {
        tbody.innerHTML += `
            <tr>
              <td>${item.rprtRefNo}</td>
              <td>${item.rprtTpCd}</td>
              <td>${item.orgnNm}</td>
              <td>${item.rprtInfNtr}</td>
              <td>${item.rprtInfDttm}</td>
              <td>${item.rprtInfPlc}</td>
              <td>${item.cagValTtl || "-"}</td>
            </tr>`;
      });
    } else {
      thead.innerHTML = `<tr><th>المرجع</th><th>العنوان</th><th>الوصف</th><th>التاريخ</th><th>الفرقة</th></tr>`;
      list.forEach(item => {
        tbody.innerHTML += `
            <tr>
              <td>${item.rprtIncRefNo}</td>
              <td>${item.rprtIncTtl}</td>
              <td>${item.rprtIncDesc}</td>
              <td>${item.rprtIncDttm}</td>
              <td>${item.orgnCd}</td>
            </tr>`;
      });
    }

    table.appendChild(thead);
    table.appendChild(tbody);
    section.appendChild(table);
  } else {
    list.forEach(item => {
      const div = document.createElement("div");
      div.className = "compact-text";
      if (type === "rprt") {
        div.innerHTML = `<b>${item.rprtRefNo}</b> – ${item.rprtInfNtr}, بـ${item.rprtInfPlc} (${item.orgnCd}) [${item.rprtInfDttm}]`;
      } else {
        div.innerHTML = `<b>${item.rprtIncRefNo}</b> – ${item.rprtIncTtl}: ${item.rprtIncDesc} (${item.orgnCd}) [${item.rprtIncDttm}]`;
      }
      section.appendChild(div);
    });
  }

  container.appendChild(section);
}

// Init
render();

// todo


async function brq1_bntsearch_click() {
  try {
    // 1️⃣ Construire la requête (tu peux ajouter params du formulaire ici)
    // const url = "/api/coc/reports";
    const url = "/api/coc/print-test";

    // 2️⃣ Fetch API
    const response = await fetch(url, {
      method: "GET",
      headers: {"Content-Type": "application/json"}
    });

    if (!response.ok) {
      throw new Error("Erreur API: " + response.status);
    }

    const reports = await response.json();
    console.log("Résultats reçus:", reports);

    // 3️⃣ Injecter les résultats dans jsGrid
    $("#brq1_results_grid").jsGrid({
      width: "100%",
      height: "400px",

      inserting: false,
      editing: false,
      sorting: true,
      paging: true,

      data: reports,

      fields: [
        {name: "reportRefNo", title: "N° Réf", type: "text", width: 150},
        {name: "organizationCode", title: "Code org.", type: "text", width: 80},
        {name: "reportTypeCode", title: "Type", type: "text", width: 70},
        {name: "reportInfoDateTime", title: "Date", type: "text", width: 120},
        {name: "reportInfoNature", title: "Nature", type: "text", width: 200},
        {name: "validationStatus", title: "État", type: "text", width: 100}
      ]
    });

    // 4️⃣ Appeler la fonction render() pour préparer l’impression

    render(reports);

  } catch (err) {
    console.error("Erreur lors du fetch des rapports:", err);
    alert("Impossible de charger les rapports.");
  }
}

