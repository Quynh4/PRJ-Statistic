<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Font Awesome CDN link for icons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">        
        <style>
            /* Import Google font - Poppins */
            @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap');
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }
            :root {
                --dark: #34495E;
                --light: #ffffff;
                --success: #0ABF30;
                --error: #E24D4C;
                --warning: #E9BD0C;
                --info: #3498DB;
            }
            body {
                display: flex;
                align-items: center;
                justify-content: center;
                min-height: 100vh;
            }
            .notifications {
                position: fixed;
                top: 30px;
                right: 20px;
            }
            .notifications :where(.toast, .column) {
                display: flex;
                align-items: center;
            }
            .notifications .toast {
                width: 400px;
                position: relative;
                overflow: hidden;
                list-style: none;
                border-radius: 4px;
                padding: 16px 17px;
                margin-bottom: 10px;
                background: var(--dark);
                justify-content: space-between;
                animation: show_toast 0.3s ease forwards;
            }
            @keyframes show_toast {
                0% {
                    transform: translateX(100%);
                }
                40% {
                    transform: translateX(-5%);
                }
                80% {
                    transform: translateX(0%);
                }
                100% {
                    transform: translateX(-10px);
                }
            }
            .notifications .toast.hide {
                animation: hide_toast 0.3s ease forwards;
            }
            @keyframes hide_toast {
                0% {
                    transform: translateX(-10px);
                }
                40% {
                    transform: translateX(0%);
                }
                80% {
                    transform: translateX(-5%);
                }
                100% {
                    transform: translateX(calc(100% + 20px));
                }
            }
            .toast::before {
                position: absolute;
                content: "";
                height: 3px;
                width: 100%;
                bottom: 0px;
                left: 0px;
                animation: progress 5s linear forwards;
            }
            @keyframes progress {
                100% {
                    width: 0%;
                }
            }
            .toast.success::before, .btn#success {
                background: var(--success);
            }
            .toast.error::before, .btn#error {
                background: var(--error);
            }
            .toast.warning::before, .btn#warning {
                background: var(--warning);
            }
            .toast.info::before, .btn#info {
                background: var(--info);
            }
            .toast .column i {
                font-size: 1.75rem;
            }
            .toast.success .column i {
                color: var(--success);
            }
            .toast.error .column i {
                color: var(--error);
            }
            .toast.warning .column i {
                color: var(--warning);
            }
            .toast.info .column i {
                color: var(--info);
            }
            .toast .column span {
                font-size: 1.07rem;
                margin-left: 12px;
            }
            .toast i:last-child {
                color: #aeb0d7;
                cursor: pointer;
            }
            .toast i:last-child:hover {
                color: var(--dark);
            }
            .buttons .btn {
                border: none;
                outline: none;
                cursor: pointer;
                margin: 0 5px;
                color: var(--light);
                font-size: 1.2rem;
                padding: 10px 20px;
                border-radius: 4px;
            }
            @media screen and (max-width: 530px) {
                .notifications {
                    width: 95%;
                }
                .notifications .toast {
                    width: 100%;
                    font-size: 1rem;
                    margin-left: 20px;
                }
                .buttons .btn {
                    margin: 0 1px;
                    font-size: 1.1rem;
                    padding: 8px 15px;
                }
            }
        </style>
    </head>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
    <body>

        <div style="display: flex">
            <canvas id="myChart" style="width:100%;max-width:600px"></canvas>

            <canvas id="myChart1" style="width:100%;max-width:600px"></canvas>
        </div>

        <ul class="notifications"></ul>
        <div class="buttons">
            <button class="btn" id="success">Success</button>
            <button class="btn" id="error">Error</button>
            <button class="btn" id="warning">Warning</button>
            <button class="btn" id="info">Info</button>
        </div>
        <script>
            const xValues = [`${data.thang1st.monthValue}/${data.thang1st.year}`,
                    `${data.thang2st.monthValue}/${data.thang2st.year}`,
                            `${data.thang3st.monthValue}/${data.thang3st.year}`,
                                    `${data.thang4st.monthValue}/${data.thang4st.year}`,
                                            `${data.thang5st.monthValue}/${data.thang5st.year}`,
                                                    `${data.thang6st.monthValue}/${data.thang6st.year}`,
                                                        ];
                                                        const yValues = [${data.doanhthu1st}, ${data.doanhthu2st}, ${data.doanhthu3st}, ${data.doanhthu4st}, ${data.doanhthu5st}, ${data.doanhthu6st}];
                                                        const barColors = ["red", "green", "blue", "orange", "white"];

                                                        new Chart("myChart", {
                                                            type: "pie",
                                                            data: {
                                                                labels: xValues,
                                                                datasets: [{
                                                                        backgroundColor: barColors,
                                                                        data: yValues
                                                                    }]
                                                            },
                                                            options: {
                                                                legend: {display: false},
                                                                title: {
                                                                    display: true,
                                                                    text: "Doanh thu 6 thang gan nhat"
                                                                }
                                                            }
                                                        });



                                                        new Chart("myChart1", {
                                                            type: "bar",
                                                            data: {
                                                                labels: xValues,
                                                                datasets: [{
                                                                        backgroundColor: barColors,
                                                                        data: yValues
                                                                    }]
                                                            },
                                                            options: {
                                                                legend: {display: false},
                                                                title: {
                                                                    display: true,
                                                                    text: "World Wine Production 2018"
                                                                }
                                                            }
                                                        });

                                                        const notifications = document.querySelector(".notifications"),
                                                                buttons = document.querySelectorAll(".buttons .btn");
// Object containing details for different types of toasts
                                                        const toastDetails = {
                                                            timer: 5000,
                                                            success: {
                                                                icon: 'fa-circle-check',
                                                                text: 'Success: This is a success toast.',
                                                            },
                                                            error: {
                                                                icon: 'fa-circle-xmark',
                                                                text: 'Error: This is an error toast.',
                                                            },
                                                            warning: {
                                                                icon: 'fa-triangle-exclamation',
                                                                text: 'Warning: This is a warning toast.',
                                                            },
                                                            info: {
                                                                icon: 'fa-circle-info',
                                                                text: 'Info: This is an information toast.',
                                                            }
                                                        }
                                                        const removeToast = (toast) => {
                                                            toast.classList.add("hide");
                                                            if (toast.timeoutId)
                                                                clearTimeout(toast.timeoutId); // Clearing the timeout for the toast
                                                            setTimeout(() => toast.remove(), 500); // Removing the toast after 500ms
                                                        }
                                                        const createToast = (id) => {
                                                            // Getting the icon and text for the toast based on the id passed
                                                            const {icon, text} = toastDetails[id];
                                                            const toast = document.createElement("li"); // Creating a new 'li' element for the toast
                                                            toast.className = `toast ${id}`; // Setting the classes for the toast
                                                            // Setting the inner HTML for the toast
                                                            toast.innerHTML = `<div class="column">
                         <i class="fa-solid ${icon}"></i>
                         <span>${text}</span>
                      </div>
                      <i class="fa-solid fa-xmark" onclick="removeToast(this.parentElement)"></i>`;
                                                            notifications.appendChild(toast); // Append the toast to the notification ul
                                                            // Setting a timeout to remove the toast after the specified duration
                                                            toast.timeoutId = setTimeout(() => removeToast(toast), toastDetails.timer);
                                                        }
// Adding a click event listener to each button to create a toast when clicked
                                                        buttons.forEach(btn => {
                                                            btn.addEventListener("click", () => createToast(btn.id));
                                                        });
        </script>

abc
    </body>
</html>
