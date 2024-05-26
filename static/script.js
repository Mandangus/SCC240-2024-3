function showFields() {
    var entity = document.getElementById("entity").value;
    var fields = document.querySelectorAll(".entity-fields");
    fields.forEach(field => field.style.display = "none");

    if (entity) {
        var entityFields = document.getElementById(entity + "-fields");
        if (entityFields) {
            entityFields.style.display = "block";
        }
    }
}

function toggleDoadorFields() {
        var tipoDoador = document.getElementById("tipo_doador").value;
        var cpfField = document.getElementById("cpf_field");
        var cnpjField = document.getElementById("cnpj_field");

        if (tipoDoador == "Físico") {
            cpfField.style.display = "block";
            cnpjField.style.display = "none";
        } else if (tipoDoador == "Jurídico") {
            cpfField.style.display = "block";
            cnpjField.style.display = "none";
        } else {
            cpfField.style.display = "none";
            cnpjField.style.display = "none";
        }
    }

    function toggleForm() {
        var doadorTipo = document.getElementById("doador_tipo").value;
        var pfForm = document.getElementById("doacaoPF-fields");
        var pjForm = document.getElementById("doacaoPJ-fields");
        
        if (doadorTipo === "Físico") {
            pfForm.style.display = "block";
            pjForm.style.display = "none";
        } else if (doadorTipo === "Jurídico") {
            pfForm.style.display = "none";
            pjForm.style.display = "block";
        } else {
            pfForm.style.display = "none";
            pjForm.style.display = "none";
        }
    }


    function toggleDoadorFields() {
    var tipoDoador = document.getElementById("tipo_doador").value;
    var cpfField = document.getElementById("cpf_field");
    var cnpjField = document.getElementById("cnpj_field");

    if (tipoDoador === "Físico") {
        cpfField.style.display = "block";
        cnpjField.style.display = "none";
    } else if (tipoDoador === "Jurídico") {
        cnpjField.style.display = "block";
        cpfField.style.display = "none";
    } else {
        cpfField.style.display = "none";
        cnpjField.style.display = "none";
    }
}