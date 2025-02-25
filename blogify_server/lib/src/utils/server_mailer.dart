import 'dart:developer';
import 'dart:io';

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class ServerMailer {
  static Future<bool> sendOTPMail(String otp, String mail) async {
    try {
      final htmlTemplate =
          await File('lib/src/static/email_template.html').readAsString();

      final htmlContent = htmlTemplate.replaceAll('{{OTP}}', otp);

      final smtpServer = SmtpServer(
        'smtp.gmail.com',
        port: 587,
        username: 'nitish.kr.52364@gmail.com',
        password: 'bkjm uvxt pvld vgzz',
      );

      final message = Message()
        ..from = Address('nitish.kr.52364@gmail.com', 'XYZ Company')
        ..recipients.add(mail)
        ..subject = 'OTP VERIFICATION FOR LOGIN'
        ..html = htmlContent;

      final sendPort = await send(message, smtpServer);
      log(
        'Mails sent to user with mail $mail and result is ${sendPort.toString()}',
      );
      return true;
    } on MailerException catch (e) {
      log('Failed to send mail caused By Mailer ', error: e.message);
      return false;
    } catch (e) {
      log('Failed to send mail to user with mail $mail', error: e.toString());
      return false;
    }
  }
}
