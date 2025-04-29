<template>
  <div class="container">
    <form @submit.prevent="submitForm" class="form">
      <div class="form-group">
        <label for="name">Name:</label>
        <input id="name" v-model="name" required></input>
      </div>
      <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" id="email" v-model="email" required />
      </div>
      <div class="form-group">
        <label for="message">Message:</label>
        <textarea id="message" v-model="message" required></textarea>
      </div>

      <div id="recaptcha-container" class="g-recaptcha" :data-sitekey="siteKey"></div>

      <button type="submit">Send</button>
    </form>
  </div>
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
      const script = document.createElement('script');
      script.src = 'https://www.google.com/recaptcha/api.js';
      script.async = true;
      script.defer = true;
      script.onload = this.renderRecaptcha;
      document.head.appendChild(script);
    },
    renderRecaptcha() {
      window.grecaptcha.render('recaptcha-container', {
        sitekey: this.siteKey,
      });
    },
    async submitForm() {
      this.recaptchaToken = grecaptcha.getResponse();

      if (!this.recaptchaToken) {
        alert('Veuillez compléter le captcha.');
        return;
      }

      // EmailJS
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
        alert('Message envoyé');
      } catch (error) {
        alert('Erreur envoi du message : ' + error);
        console.error(error);
      }
    },
  },
};
</script>

<style scoped>
.container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}

.form {
  display: flex;
  flex-direction: column;
  width: 100%;
  
  padding: 20px;
  border: 1px solid #ccc;
  border-radius: 4px;
}

.form-group {
  margin-bottom: 15px;
  width: 100%;
}

label {
  display: block;
  margin-bottom: 5px;
  color: aliceblue;
}

input, textarea {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: none;
}

button {
  color: white;
  padding: 10px 15px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  width: 100%;
  max-width: 304px;
  align-self: center;
}
.g-recaptcha{
  align-self: center;
}
textarea{
  min-height: 200px;
}


</style>

