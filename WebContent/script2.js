/* Toggle functionality for user  */
function userToggle() {
  const userlists = document.querySelector('.userlist');
  const panelusers = document.querySelectorAll('.paneluser');
  if (userlists) {
    userlists.addEventListener('click', (e) => {
      if (e.target.tagName === 'LI') {
        const targetUserPanel = document.querySelector(e.target.dataset.target);

        panelusers.forEach((paneluser) => {
          if (paneluser === targetUserPanel) {
            paneluser.classList.add('activerUserPanel');
          } else {
            paneluser.classList.remove('activerUserPanel');
          }
        });
      }
    });
  }
}

/* Toggle functionality for admin panel */
function adminToggle() {
  const lists = document.querySelector('.list');
  const panels = document.querySelectorAll('.panel');
  if (lists) {
    lists.addEventListener('click', (e) => {
      if (e.target.tagName === 'LI') {
        const targetPanel = document.querySelector(e.target.dataset.target);


        panels.forEach((panel) => {
          if (panel === targetPanel) {
            panel.classList.add('active');
          } else {
            panel.classList.remove('active');
          }
        });
      }
    });
  }
}

function adminLoanToggle() {
  const lists = document.querySelector('.current-repaid');
  const panels = document.querySelectorAll('.panel');
  if (lists) {
    lists.addEventListener('click', (e) => {
      if (e.target.tagName === 'LI') {
        const targetPanel = document.querySelector(e.target.dataset.target);


        panels.forEach((panel) => {
          if (panel === targetPanel) {
            panel.classList.add('active');
          } else {
            panel.classList.remove('active');
          }
        });
      }
    });
  }
}

function popVerify() {
  const views = document.querySelectorAll('.trigger_popup');
  const popup = document.querySelector('.hover_popup');
  const CloseButton = document.querySelector('.popupCloseButton');
  views.forEach((view) => {
    view.addEventListener('click', (e) => {
      e.preventDefault();
      popup.classList.add('active');
    });
  });

  CloseButton.addEventListener('click', () => {
    popup.classList.remove('active');
  });
}

function popLoan() {
  const views = document.querySelectorAll('.trigger_popup_loan');
  const popup = document.querySelector('.loan_hover_popup');
  const CloseButton = document.querySelector('.loan_popupCloseButton');
  views.forEach((view) => {
    view.addEventListener('click', (e) => {
      e.preventDefault();
      popup.classList.add('active');
    });
  });

  CloseButton.addEventListener('click', () => {
    popup.classList.remove('active');
  });
}

function popLoanApprove() {
  const views = document.querySelectorAll('.trigger_popup_approveloan');
  const popup = document.querySelector('.loanapprove_hover_popup');
  const CloseButton = document.querySelector('.loanapprove_popupCloseButton');
  views.forEach((view) => {
    view.addEventListener('click', (e) => {
      e.preventDefault();
      popup.classList.add('active');
    });
  });

  CloseButton.addEventListener('click', () => {
    popup.classList.remove('active');
  });
}


userToggle();
adminToggle();
popVerify();
popLoan();
popLoanApprove();
adminLoanToggle();
