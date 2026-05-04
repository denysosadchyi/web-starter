/* ==========================================================================
   main.js — all interactive behavior, vanilla, no framework
   Sections numbered for navigability. Add new ones at the bottom.

   1. Header scroll behavior
   2. Mobile menu drawer
   ========================================================================== */

(() => {
  'use strict';

  /* 1. Header scroll behavior ────────────────────────────────────────────── */
  const header = document.querySelector('header.site');
  if (header) {
    let ticking = false;
    const onScroll = () => {
      if (!ticking) {
        window.requestAnimationFrame(() => {
          header.classList.toggle('scrolled', window.scrollY > 24);
          ticking = false;
        });
        ticking = true;
      }
    };
    window.addEventListener('scroll', onScroll, { passive: true });
  }

  /* 2. Mobile menu drawer ────────────────────────────────────────────────── */
  const openBtn = document.querySelector('[data-action="open-menu"]');
  const closeBtn = document.querySelector('[data-action="close-menu"]');
  const drawer = document.querySelector('.site-drawer');

  const openMenu = () => {
    document.body.classList.add('menu-open');
    drawer?.setAttribute('aria-hidden', 'false');
  };
  const closeMenu = () => {
    document.body.classList.remove('menu-open');
    drawer?.setAttribute('aria-hidden', 'true');
  };

  openBtn?.addEventListener('click', openMenu);
  closeBtn?.addEventListener('click', closeMenu);

  // Close on link click (drawer should never linger after navigation)
  drawer?.querySelectorAll('a').forEach(link => {
    link.addEventListener('click', closeMenu);
  });

  // Close on Escape
  document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape' && document.body.classList.contains('menu-open')) {
      closeMenu();
    }
  });

})();
