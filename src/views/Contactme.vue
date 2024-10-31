<template>
  <form @submit.prevent="submitForm">
    <div>
      <label for="name">Name:</label>
      <textarea id="name" v-model="name" required></textarea>
    </div>
    <div>
      <label for="email">Email:</label>
      <input type="email" id="email" v-model="email" required />
    </div>
    <div>
      <label for="message">Message:</label>
      <textarea id="message" v-model="message" required></textarea>
    </div>

    <div id="recaptcha-container"></div>

    <button type="submit">Send</button>
  </form>
</template>
  
  <script>
  
  import emailjs from 'emailjs-com';

export default {
  data() {
    return {
      email: '',
      name: '',
      message: '',
      recaptchaToken: '',
      siteKey: '6LewiHEqAAAAACHpaY_saYKhAgeRxXifRTwS0loV', 
    };
  },
  mounted() {
    this.loadRecaptcha();
  },
  methods: {
    loadRecaptcha() {
      if (!document.getElementById('recaptcha-script')) {
        const script = document.createElement('script');
        script.src = 'https://www.google.com/recaptcha/api.js';
        script.async = true;
        script.defer = true;
        script.id = 'recaptcha-script';
        script.onload = this.renderRecaptcha;
        document.head.appendChild(script);
      } else {
        this.renderRecaptcha();
      }
    },
    renderRecaptcha() {
      window.grecaptcha.render('recaptcha-container', {
        sitekey: this.siteKey,
        callback: (token) => {
          this.recaptchaToken = token;
        },
      });
    },
    async submitForm() {
      if (!this.recaptchaToken) {
        alert('Veuillez compléter le captcha.');
        return;
      }

      //email template
      const templateParams = {
        email: this.email,
        from_name: this.name,
        message: this.message,
        'g-recaptcha-response': this.recaptchaToken,
      };

      try {
        await emailjs.send(
          'service_ab5tew6',
          'template_gdcelst',
          templateParams,
          '86fplQJwzU0UPKPjj'
        );
        alert('Message sent successfully');
      } catch (error) {
        alert('Error sending message: ' + error);
        console.error(error);
      }
    },
  },
};

  </script>
  
  <style scoped>
  form{
    padding-top:50px;
  }
  </style>