<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Scholarship Application Form for creating or editing scholarship details.">
    <title>Scholarship Management Form</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #003087;
            --secondary-color: #005f73;
            --accent-color: #94d2bd;
            --background-color: #f4f7fa;
            --text-color: #1a202c;
            --error-color: #e63946;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background-color: var(--background-color);
            color: var(--text-color);
            line-height: 1.6;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            max-width: 900px;
            width: 100%;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            padding: 40px;
            margin: 20px auto;
        }

        h2 {
            color: var(--primary-color);
            font-size: clamp(1.8rem, 5vw, 2rem);
            font-weight: 700;
            text-align: center;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-size: clamp(1rem, 2.5vw, 1.1rem);
            font-weight: 500;
            color: var(--text-color);
            margin-bottom: 8px;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"],
        textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            font-size: clamp(0.9rem, 2.5vw, 1rem);
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        input:focus,
        textarea:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(0, 48, 135, 0.1);
        }

        textarea {
            height: 120px;
            resize: vertical;
        }

        .form-error {
            color: var(--error-color);
            font-size: clamp(0.8rem, 2vw, 0.9rem);
            margin-top: 5px;
            display: none;
        }

        button {
            display: block;
            width: 100%;
            padding: 14px;
            background-color: var(--primary-color);
            color: #ffffff;
            border: none;
            border-radius: 6px;
            font-size: clamp(1rem, 2.5vw, 1.1rem);
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        button:hover {
            background-color: var(--secondary-color);
            transform: translateY(-2px);
        }

        button:active {
            transform: translateY(0);
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 30px;
            color: var(--primary-color);
            font-size: clamp(0.9rem, 2.5vw, 1rem);
            font-weight: 500;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .back-link:hover {
            color: var(--secondary-color);
            text-decoration: underline;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                padding: 30px;
                margin: 15px;
            }

            h2 {
                font-size: clamp(1.5rem, 4.5vw, 1.8rem);
            }

            .form-group {
                margin-bottom: 15px;
            }

            input[type="text"],
            input[type="number"],
            input[type="date"],
            textarea {
                padding: 10px;
            }

            button {
                padding: 12px;
                font-size: clamp(0.9rem, 2.5vw, 1rem);
            }
        }

        @media (max-width: 480px) {
            .container {
                padding: 20px;
                margin: 10px;
            }

            h2 {
                font-size: clamp(1.3rem, 4vw, 1.5rem);
                margin-bottom: 20px;
            }

            label {
                font-size: clamp(0.9rem, 2.5vw, 1rem);
            }

            input[type="text"],
            input[type="number"],
            input[type="date"],
            textarea {
                padding: 8px;
                font-size: clamp(0.85rem, 2.5vw, 0.9rem);
            }

            textarea {
                height: 100px;
            }

            .form-error {
                font-size: clamp(0.75rem, 2vw, 0.85rem);
            }

            button {
                padding: 10px;
                font-size: clamp(0.85rem, 2.5vw, 0.9rem);
            }

            .back-link {
                margin-top: 20px;
                font-size: clamp(0.85rem, 2.5vw, 0.9rem);
            }
        }
    </style>
</head>
<body>
<div class="container">
    <c:choose>
        <c:when test="${not empty sch}">
            <h2>Edit Scholarship Details</h2>
            <form method="post" action="${pageContext.request.contextPath}/scholarship" id="scholarshipForm">
                <input type="hidden" name="id" value="${sch.scholarshipId}"/>
                
                <div class="form-group">
                    <label for="title">Scholarship Title</label>
                    <input type="text" id="title" name="title" value="${sch.title}" required aria-required="true"/>
                    <div class="form-error" id="title-error">Please enter a valid title.</div>
                </div>
                
                <div class="form-group">
                    <label for="description">Description</label>
                    <textarea id="description" name="description" required aria-required="true">${sch.description}</textarea>
                    <div class="form-error" id="description-error">Please provide a description.</div>
                </div>
                
                <div class="form-group">
                    <label for="eligibility">Eligibility Criteria</label>
                    <textarea id="eligibility" name="eligibility" required aria-required="true">${sch.eligibilityCriteria}</textarea>
                    <div class="form-error" id="eligibility-error">Please specify eligibility criteria.</div>
                </div>
                
                <div class="form-group">
                    <label for="amount">Award Amount ($)</label>
                    <input type="number" id="amount" step="0.01" name="amount" value="${sch.amount}" required aria-required="true"/>
                    <div class="form-error" id="amount-error">Please enter a valid amount.</div>
                </div>
                
                <div class="form-group">
                    <label for="deadline">Application Deadline</label>
                    <input type="date" id="deadline" name="deadline" value="${sch.applicationDeadline}" required aria-required="true"/>
                    <div class="form-error" id="deadline-error">Please select a valid date.</div>
                </div>
                
                <button type="submit">Update Scholarship</button>
            </form>
        </c:when>
        <c:otherwise>
            <h2>Create New Scholarship</h2>
            <form method="post" action="${pageContext.request.contextPath}/scholarship" id="scholarshipForm">
                <div class="form-group">
                    <label for="title">Scholarship Title</label>
                    <input type="text" id="title" name="title" required aria-required="true"/>
                    <div class="form-error" id="title-error">Please enter a valid title.</div>
                </div>
                
                <div class="form-group">
                    <label for="description">Description</label>
                    <textarea id="description" name="description" required aria-required="true"></textarea>
                    <div class="form-error" id="description-error">Please provide a description.</div>
                </div>
                
                <div class="form-group">
                    <label for="eligibility">Eligibility Criteria</label>
                    <textarea id="eligibility" name="eligibility" required aria-required="true"></textarea>
                    <div class="form-error" id="eligibility-error">Please specify eligibility criteria.</div>
                </div>
                
                <div class="form-group">
                    <label for="amount">Award Amount ($)</label>
                    <input type="number" id="amount" step="0.01" name="amount" required aria-required="true"/>
                    <div class="form-error" id="amount-error">Please enter a valid amount.</div>
                </div>
                
                <div class="form-group">
                    <label for="deadline">Application Deadline</label>
                    <input type="date" id="deadline" name="deadline" required aria-required="true"/>
                    <div class="form-error" id="deadline-error">Please select a valid date.</div>
                </div>
                
                <button type="submit">Create Scholarship</button>
            </form>
        </c:otherwise>
    </c:choose>
    
    <a href="${pageContext.request.contextPath}/scholarship" class="back-link">Return to Scholarship List</a>
</div>

<script>
    document.getElementById('scholarshipForm').addEventListener('submit', function(e) {
        let isValid = true;
        const fields = [
            { id: 'title', errorId: 'title-error', validate: val => val.trim().length > 0 },
            { id: 'description', errorId: 'description-error', validate: val => val.trim().length > 0 },
            { id: 'eligibility', errorId: 'eligibility-error', validate: val => val.trim().length > 0 },
            { id: 'amount', errorId: 'amount-error', validate: val => val > 0 },
            { id: 'deadline', errorId: 'deadline-error', validate: val => val && new Date(val) >= new Date() }
        ];

        fields.forEach(field => {
            const input = document.getElementById(field.id);
            const error = document.getElementById(field.errorId);
            if (!field.validate(input.value)) {
                error.style.display = 'block';
                isValid = false;
            } else {
                error.style.display = 'none';
            }
        });

        if (!isValid) {
            e.preventDefault();
        }
    });
</script>
</body>
</html>