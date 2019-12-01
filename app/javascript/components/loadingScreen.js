const loadScreen = () => {
  const loadingScreen = document.getElementById('loading-screen');
  const home = document.getElementById('home');
  if (home && loadingScreen) {
    loadingScreen.classList.add('d-none');
    home.classList.remove('d-none');
  }
};

export { loadScreen };
