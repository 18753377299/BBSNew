/**
 * controller
 * @return 
 */
var nodemailer = require('nodemailer');
var fs = require('fs');
module.exports = Controller("Home/BaseController", function(){
  "use strict";
  return {
    indexAction: function(){
        var _this = this;
        // create reusable transporter object using SMTP transport
        var transporter = nodemailer.createTransport({
            host: 'smtp.163.com',
            port: 25,
            auth: {
                user: '',//发送方邮箱
                pass: ''//密码
            }
        });

        // NB! No need to recreate the transporter object. You can use
        // the same transporter object for all e-mails
        if(this.isAjax()){
            //读取邮件列表文件里面所有的邮箱
            var mail = fs.readFileSync(RESOURCE_PATH + '/resource/maillist.txt',{encoding:'utf-8'});
            var data = mail.split('\r\n');
            var result = data.join(',');

            var mailOptions = {
                from: '', //发送方邮箱
                to: result, 
                subject: this.post('title'), 
                text: this.post('title'), 
                html: '<div>'+this.post('content')+'</div>' // html body
            };

            // send mail with defined transport object
            transporter.sendMail(mailOptions, function(error, info){
                if(error){
                    console.log(error);
                    _this.json({code:0,msg:'发送失败!'});
                }else{
                    console.log('Message sent: ' + info.response);
                    _this.json({code:1,msg:'发送成功!'});
                }
            });
            return false;
        }
       
      //render View/Home/index_index.html file
      this.display();
    },
    uploadsAction:function(){
        this.end(123);
    },
    maillistAction:function(){
        var mail = fs.readFileSync(RESOURCE_PATH + '/resource/maillist.txt',{encoding:'utf-8'});
        var data = mail.split('\r\n');
        this.assign('data',data);
        this.display();
    },
    addmailAction:function(){
        var self = this;
        if(this.isAjax()){

            var mail = this.post('mail');
            var res = fs.appendFile(RESOURCE_PATH + '/resource/maillist.txt','\r\n'+mail,function(err){
                 if (err) {
                    return self.json({code:0,msg:'添加失败!'});
                 };
                return self.json({code:1,msg:'添加成功!'});
            });
            
            return false;
        }


        this.display();

    },
    delAction:function(){
        var self = this;
        if(this.isAjax()){
            var id = this.post('id');
            var mail = fs.readFileSync(RESOURCE_PATH + '/resource/maillist.txt',{encoding:'utf-8'});
            var data = mail.split('\r\n');
            data.splice(id,1);
            var result = data.join('\r\n');
            fs.writeFile(RESOURCE_PATH + '/resource/maillist.txt', result, function (err) {
              if (err) {
                    return self.json({code:0,msg:'删除失败!'});
                 };
                return self.json({code:1,msg:'删除成功!'});
            });
            return false;
        }
    },
    __call:function(action){
        console.log(action);
    }
  };
});