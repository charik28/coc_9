const fs = require("fs");
const path = require("path");

// folder containing your SQL schema files
const folder = path.resolve(__dirname, "../psql");

// simple abbreviation mapping (extend as needed)
const replacements = {
    rprt: "report",
    vyg: "voyage",
    trnp: "transport",
    cag: "cargo",
    prsn: "person",
    cmpny: "company",
    nm: "name",
    fmnm: "last_name",
    qty: "quantity",
    dt: "date",
    dttm: "datetime",
    tp: "type",
    cd: "code",
    no: "number",
    id: "id",
};

// convert old column name → readable new name
function renameColumn(oldName) {
    let newName = oldName.toLowerCase();
    for (const [abbr, full] of Object.entries(replacements)) {
        newName = newName.replace(new RegExp(abbr, "g"), full);
    }
    return newName;
}

// process SQL content
function processSql(content, tableName) {
    const lines = content.split("\n");
    const mappings = [];

    for (const line of lines) {
        const match = line.trim().match(/^"?(?<col>\w+)"?\s+[\w\(\)]+/i);
        if (match) {
            const oldName = match.groups.col;
            const newName = renameColumn(oldName);

            if (oldName !== newName) {
                mappings.push({
                    oldName,
                    newName,
                    alter: `ALTER TABLE ${tableName} RENAME COLUMN ${oldName} TO ${newName};`,
                    comment: `COMMENT ON COLUMN ${tableName}.${newName} IS '${newName.replace(/_/g, " ")}';`,
                });
            }
        }
    }
    return mappings;
}

// main execution
function main() {
    const files = fs.readdirSync(folder).filter(f => f.endsWith(".sql"));
    const results = [];

    for (const file of files) {
        const content = fs.readFileSync(path.join(folder, file), "utf-8");
        const tableMatch = content.match(/CREATE TABLE "?(\w+)"?/i);
        if (!tableMatch) continue;

        const tableName = tableMatch[1];
        const mappings = processSql(content, tableName);
        results.push(...mappings);
    }

    // write to CSV
    const csv = results
        .map(
            r =>
                `${r.oldName};${r.newName};${r.alter};${r.comment}`
        )
        .join("\n");

    fs.writeFileSync("column_mapping.csv", csv, "utf-8");
    console.log("✅ Mapping saved to column_mapping.csv");
}

main();
