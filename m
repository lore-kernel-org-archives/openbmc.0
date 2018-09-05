Return-Path: <KWLIU@nuvoton.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=kwliu@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=nuvoton.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 424wgb3VZ7zF37b
 for <openbmc@lists.ozlabs.org>; Wed,  5 Sep 2018 17:43:52 +1000 (AEST)
Received: from NTILML02.nuvoton.com (212.199.177.21.static.012.net.il
 [212.199.177.21])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w857DgH5009129
 for <openbmc@lists.ozlabs.org>; Wed, 5 Sep 2018 10:13:42 +0300
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTILML02.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (TLS) id 15.0.1130.7; Wed, 5 Sep
 2018 10:43:39 +0300
Received: from NTHCML01A.nuvoton.com ([fe80::1170:e239:c9a9:e8b8]) by
 NTHCML01A.nuvoton.com ([fe80::1170:e239:c9a9:e8b8%13]) with mapi id
 15.00.1130.005; Wed, 5 Sep 2018 15:43:37 +0800
From: <KWLIU@nuvoton.com>
To: <1450335857@qq.com>, <Avi.Fishman@nuvoton.com>,
 <eajames@linux.vnet.ibm.com>, <ed.tanous@intel.com>,
 <openbmc@lists.ozlabs.org>
Subject: RE: KVM Support?
Thread-Topic: KVM Support?
Thread-Index: AdRE5peYpu7v44mJSFmBvwAI/2Uv4w==
Date: Wed, 5 Sep 2018 07:43:37 +0000
Message-ID: <cc11de6844814426a96630c20fddaf46@NTHCML01A.nuvoton.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [27.52.41.32]
Content-Type: multipart/alternative;
 boundary="_000_cc11de6844814426a96630c20fddaf46NTHCML01Anuvotoncom_"
MIME-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Sep 2018 07:43:59 -0000

--_000_cc11de6844814426a96630c20fddaf46NTHCML01Anuvotoncom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Xiuzhi:

From your system log, I think the problem is on the Aspeed video driver(aps=
edd-video.c).

But I don't have any Aspeed platforms at hand and can't really help you to =
debug this issue,
maybe you can increase timeout value of mode detection or wait for Eddie's =
comments.

If you want to auto start/restart obmc-ikvm, you must add a service file fo=
r systemd service.
You can refer to below links.

1.       https://github.com/openbmc/openbmc/blob/master/meta-phosphor/commo=
n/recipes-phosphor/interfaces/phosphor-gevent/phosphor-gevent.service

2.       https://github.com/openbmc/openbmc/blob/master/meta-phosphor/commo=
n/recipes-phosphor/interfaces/phosphor-gevent.bb

3.       https://github.com/Nuvoton-Israel/meta-openbmc-nuvoton-addon/blob/=
openbmc-master/recipes-graphics/obmc-ikvm/obmc-ikvm/obmc-ikvm.service

4.       https://github.com/Nuvoton-Israel/meta-openbmc-nuvoton-addon/blob/=
openbmc-master/recipes-graphics/obmc-ikvm/obmc-ikvm.bb


Thanks,
Joseph
From: xiuzhi [mailto:1450335857@qq.com]
Sent: Wednesday, September 05, 2018 1:48 PM
To: IS20 Avi Fishman; CS20 KWLiu; Eddie James; Tanous, Ed; openbmc
Subject: Re:RE: Re:RE: KVM Support?

Hi  Eddie,Joseph,
    The webui can't get ikvm video when the host resolution changed .
I must kill the process :python /usr/sbin/phosphor-gevent rest_dbus.py
and restart obmc-ikvm -v /dev/video0 -i /dev/hidg0
Then the kvm on webui can get the host video image .
The system log is:
  [ 9052.912683] aspeed-video 1e700000.video: resolution changed; resetting
[ 9054.406876] aspeed-video 1e700000.video: timed out on 1st mode detect
[ 9054.413380] aspeed-video 1e700000.video: resolution changed; couldn't ge=
t new resolution

Do you have any idea to auto restart the obmc-ikvm and ?rest_dbus.py
xiuzhi
------------------ Original ------------------
From:  "Avi.Fishman";<Avi.Fishman@nuvoton.com<mailto:Avi.Fishman@nuvoton.co=
m>>;
Date:  Aug 29, 2018
To:  "KWLIU"<KWLIU@nuvoton.com<mailto:KWLIU@nuvoton.com>>; "xiuzhi"<1450335=
857@qq.com<mailto:1450335857@qq.com>>; "eajames"<eajames@linux.vnet.ibm.com=
<mailto:eajames@linux.vnet.ibm.com>>; "ed.tanous"<ed.tanous@intel.com<mailt=
o:ed.tanous@intel.com>>; "openbmc"<openbmc@lists.ozlabs.org<mailto:openbmc@=
lists.ozlabs.org>>;
Subject:  RE: Re:RE: KVM Support?

Hi Xiuzhi,

Can you take the patches and merge them to your environment?

Josef,
Maybe you need to give the commit or tag you are that above it you use your=
 patches?

Thanks,
Avi

From: openbmc <openbmc-bounces+avifishman70=3Dgmail.com@lists.ozlabs.org<ma=
ilto:openbmc-bounces+avifishman70=3Dgmail.com@lists.ozlabs.org>> On Behalf =
Of CS20 KWLiu
Sent: Wednesday, August 29, 2018 5:44 AM
To: 1450335857@qq.com<mailto:1450335857@qq.com>; eajames@linux.vnet.ibm.com=
<mailto:eajames@linux.vnet.ibm.com>; ed.tanous@intel.com<mailto:ed.tanous@i=
ntel.com>; openbmc@lists.ozlabs.org<mailto:openbmc@lists.ozlabs.org>
Subject: RE: Re:RE: KVM Support?

Hi Xiuzhi:

I think we are using different bases of the openbmc, this patch is really w=
orking on my side
Sorry for I cannot find the exact error in your message.

Thanks,
Joseph
From: xiuzhi [mailto:1450335857@qq.com]
Sent: Tuesday, August 28, 2018 6:57 PM
To: Eddie James; Tanous, Ed; CS20 KWLiu; openbmc
Subject: Re:RE: KVM Support?

Hi Joseph, Ed,
  There was an error when I  updated the patches https://github.com/Nuvoton=
-Israel/meta-openbmc-nuvoton-addon/commit/140771b7e898dd5ca8f0364290cce6696=
09088ac<https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_N=
uvoton-2DIsrael_meta-2Dopenbmc-2Dnuvoton-2Daddon_commit_140771b7e898dd5ca8f=
0364290cce669609088ac&d=3DDwMGAw&c=3Due8mO8zgC4VZ4q_aNVKt8G9MC01UFDmisvMR1k=
-EoDM&r=3D7g2D1XDc1ET3CnY1ySnaWQXPxPxfpLww1MiDbLW4v8Q&m=3DZir4Lw7xIZbwLjRk7=
ILcjDyeLfFVQzWjscAv2ZyvXXY&s=3D8SWpZ_B0Z9GOpECKSppJKXXbMTo-hNO0HuXocMRt5n0&=
e=3D>

Would you like to give me some suggestions to debug it?
 When I logged in https://<bmc_ip>/#/kvm<https://urldefense.proofpoint.com/=
v2/url?u=3Dhttps-3A__-253cbmc-5Fip-253e_-23_kvm&d=3DDwMFAg&c=3Due8mO8zgC4VZ=
4q_aNVKt8G9MC01UFDmisvMR1k-EoDM&r=3DkNeU5gwNy2cOhaTMIUoFhUPAXV51uTneHprahPM=
6I78&m=3DxFjehOYoJW0EsYnLWkBOLeUtOCSyAFs6UdQuMvfM7y4&s=3D2J0BHCud5wpV8zxnLK=
S_sDp79AfVxVQvJ5Vk3r8dhTc&e=3D>, The errors read:
"
WebSocket on-close event  app.89eaa0b6e5e9417cb602.js:38:675915
Failed when connecting: Connection closed (code: 1005)  app.89eaa0b6e5e9417=
cb602.js:38:685584
        RFB.prototype._fail https://192.168.120.132/app.89eaa0b6e5e9417cb60=
2.js:38:685584<https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__192.1=
68.120.132_app.89eaa0b6e5e9417cb602.js-3A38-3A685584&d=3DDwMFAg&c=3Due8mO8z=
gC4VZ4q_aNVKt8G9MC01UFDmisvMR1k-EoDM&r=3DkNeU5gwNy2cOhaTMIUoFhUPAXV51uTneHp=
rahPM6I78&m=3DxFjehOYoJW0EsYnLWkBOLeUtOCSyAFs6UdQuMvfM7y4&s=3DEgJDf5jL_gme8=
t1tF_wjg1-08xZxvqptSjoW3a8zohU&e=3D>
        RFB/< https://192.168.120.132/app.89eaa0b6e5e9417cb602.js:38:676138=
<https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__192.168.120.132_app=
.89eaa0b6e5e9417cb602.js-3A38-3A676138&d=3DDwMFAg&c=3Due8mO8zgC4VZ4q_aNVKt8=
G9MC01UFDmisvMR1k-EoDM&r=3DkNeU5gwNy2cOhaTMIUoFhUPAXV51uTneHprahPM6I78&m=3D=
xFjehOYoJW0EsYnLWkBOLeUtOCSyAFs6UdQuMvfM7y4&s=3DdIWffzOhDWjQl-iTTJj_38z606a=
i7gLJSynBqbAZXW8&e=3D>
        Websock.prototype.open/this._websocket.onclose< https://192.168.120=
.132/app.89eaa0b6e5e9417cb602.js:38:778159<https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__192.168.120.132_app.89eaa0b6e5e9417cb602.js-3A38-3A7=
78159&d=3DDwMFAg&c=3Due8mO8zgC4VZ4q_aNVKt8G9MC01UFDmisvMR1k-EoDM&r=3DkNeU5g=
wNy2cOhaTMIUoFhUPAXV51uTneHprahPM6I78&m=3DxFjehOYoJW0EsYnLWkBOLeUtOCSyAFs6U=
dQuMvfM7y4&s=3DoJ5yHA_oCl5ihumZXKGL7rDbby1iZ0j2J4hWMLB-hEY&e=3D>
New state 'disconnecting', was 'connecting'.  app.89eaa0b6e5e9417cb602.js:3=
8:684301
>> RFB.disconnect  app.89eaa0b6e5e9417cb602.js:38:680495
>> Keyboard.allKeysUp  app.89eaa0b6e5e9417cb602.js:38:739659
<< Keyboard.allKeysUp  app.89eaa0b6e5e9417cb602.js:38:739828
"
The line 38 of app.89eaa0b6e5e9417cb602.js is :
void 0!=3D=3Dmodule&&void 0!=3D=3Dexports&&module.exports=3D=3D=3Dexports&&=
(module.exports=3D"ui.router"),function(window,angular,undefined){"use stri=
ct";var $$UMFP,isDefined=3Dangular.isDefined,isFunction=3Dangular.isFunctio=
n,isString=3Dangular.isString,isObject=3Dangular.isObject,isArray=3Dangular=
.isArray,forEach=3Dangular.forEach,extend=3Dangular.extend,copy=3Dangular.c=
opy,toJson=3Dangular.toJson;function inherit(parent,extra){return extend(ne=
w(extend(function(){},{prototype:parent})),extra)}function merge(dst){retur=
n forEach(arguments,function(obj){obj!=3D=3Ddst&&forEach(obj,function(value=
,key){dst.hasOwnProperty(key)||(dst[key]=3Dvalue)})}),dst}function objectKe=
ys(object){if(Object.keys)return Object.keys(object);var result=3D[];return=
 forEach(object,function(val,key){result.push(key)}),result}function indexO=
f(array,value){if(Array.prototype.indexOf)return array.indexOf(value,Number=
(arguments[2])||0);var len=3Darray.length>>>0,from=3DNumber(arguments[2])||=
0;for((from=3Dfrom<0?Math.ceil(from):Math.floor(from))<0&&(from+=3Dlen);fro=
m<len;from++)if(from in array&&array[from]=3D=3D=3Dvalue)return from;return=
-1}function inheritParams(currentParams,newParams,$current,$to) ... ...

Best,
Xiuzhi
>Hi Eddie & Ed:



>Do you have any plan to support non-jpeg video stream in obmc-iKVM?

>It is possible some platforms don't have hardware JPEG engine, instead hav=
e the RGB video stream.

>If possible to support RGB video stream, I think it would be better if you=
 can add the video frame differentiation in obmc-iKVM because we don't need=
 to send the full screen >to VNC client on every request, it can reduce the=
 buffer size at least. (libvncserver already has the video frame differenti=
ation)



>Also, I have implemented a KVM application for our platform(nuvoton evb-np=
cm750) which has hardware video frame differentiation and hardware hextile =
engine.

https://github.com/Nuvoton-Israel/obmc-ikvm<https://urldefense.proofpoint.c=
om/v2/url?u=3Dhttps-3A__github.com_Nuvoton-2DIsrael_obmc-2Dikvm&d=3DDwMGAw&=
c=3Due8mO8zgC4VZ4q_aNVKt8G9MC01UFDmisvMR1k-EoDM&r=3D7g2D1XDc1ET3CnY1ySnaWQX=
PxPxfpLww1MiDbLW4v8Q&m=3DZir4Lw7xIZbwLjRk7ILcjDyeLfFVQzWjscAv2ZyvXXY&s=3D92=
D29zgWEhIBYgHR9Q7lkZzREnMSwnqyhl1nEMyqXFM&e=3D>

https://github.com/Nuvoton-Israel/linux/commit/7e90f572323e56e9425b85aafe86=
dfa5a35c4e7d<https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.=
com_Nuvoton-2DIsrael_linux_commit_7e90f572323e56e9425b85aafe86dfa5a35c4e7d&=
d=3DDwMGAw&c=3Due8mO8zgC4VZ4q_aNVKt8G9MC01UFDmisvMR1k-EoDM&r=3D7g2D1XDc1ET3=
CnY1ySnaWQXPxPxfpLww1MiDbLW4v8Q&m=3DZir4Lw7xIZbwLjRk7ILcjDyeLfFVQzWjscAv2Zy=
vXXY&s=3D1JBlTPOERz49VFrLgiw014ZnBqab0r8xdRIe6Fee1JA&e=3D>



>I also enabled ED's KVM webui and added kvmws proxy in python web server.

https://github.com/Nuvoton-Israel/meta-openbmc-nuvoton-addon/commit/140771b=
7e898dd5ca8f0364290cce669609088ac<https://urldefense.proofpoint.com/v2/url?=
u=3Dhttps-3A__github.com_Nuvoton-2DIsrael_meta-2Dopenbmc-2Dnuvoton-2Daddon_=
commit_140771b7e898dd5ca8f0364290cce669609088ac&d=3DDwMGAw&c=3Due8mO8zgC4VZ=
4q_aNVKt8G9MC01UFDmisvMR1k-EoDM&r=3D7g2D1XDc1ET3CnY1ySnaWQXPxPxfpLww1MiDbLW=
4v8Q&m=3DZir4Lw7xIZbwLjRk7ILcjDyeLfFVQzWjscAv2ZyvXXY&s=3D8SWpZ_B0Z9GOpECKSp=
pJKXXbMTo-hNO0HuXocMRt5n0&e=3D>



>If you can spare a few minutes to review my implementation is my pleasure.



>Currently, my video driver is not v4l2, so I am going to redesign it to fi=
t v4l2 and your obmc-iKVM, then I will try to add the RGB format support in=
 your obmc-ikvm.



>Regarding the larger binary size, I think we need to review all configurat=
ions of libvncserver and check which functions should be disabled.



>Thanks,

>Joseph Liu.


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
The privileged confidential information contained in this email is intended=
 for use only by the addressees as indicated by the original sender of this=
 email. If you are not the addressee indicated in this email or are not res=
ponsible for delivery of the email to such a person, please kindly reply to=
 the sender indicating this fact and delete all copies of it from your comp=
uter and network server immediately. Your cooperation is highly appreciated=
. It is advised that any unauthorized use of confidential information of Nu=
voton is strictly prohibited; and any information in this email irrelevant =
to the official business of Nuvoton shall be deemed as neither given nor en=
dorsed by Nuvoton.


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
The privileged confidential information contained in this email is intended=
 for use only by the addressees as indicated by the original sender of this=
 email. If you are not the addressee indicated in this email or are not res=
ponsible for delivery of the email to such a person, please kindly reply to=
 the sender indicating this fact and delete all copies of it from your comp=
uter and network server immediately. Your cooperation is highly appreciated=
. It is advised that any unauthorized use of confidential information of Nu=
voton is strictly prohibited; and any information in this email irrelevant =
to the official business of Nuvoton shall be deemed as neither given nor en=
dorsed by Nuvoton.


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
The privileged confidential information contained in this email is intended=
 for use only by the addressees as indicated by the original sender of this=
 email. If you are not the addressee indicated in this email or are not res=
ponsible for delivery of the email to such a person, please kindly reply to=
 the sender indicating this fact and delete all copies of it from your comp=
uter and network server immediately. Your cooperation is highly appreciated=
. It is advised that any unauthorized use of confidential information of Nu=
voton is strictly prohibited; and any information in this email irrelevant =
to the official business of Nuvoton shall be deemed as neither given nor en=
dorsed by Nuvoton.

--_000_cc11de6844814426a96630c20fddaf46NTHCML01Anuvotoncom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Arial Narrow";
	panose-1:2 11 6 6 2 2 2 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{mso-style-priority:99;
	mso-style-link:"Balloon Text Char";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:8.0pt;
	font-family:"Cambria","serif";}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:24.0pt;
	margin-bottom:.0001pt;
	mso-para-margin-top:0cm;
	mso-para-margin-right:0cm;
	mso-para-margin-bottom:0cm;
	mso-para-margin-left:2.0gd;
	mso-para-margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:"Courier New";}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
span.BalloonTextChar
	{mso-style-name:"Balloon Text Char";
	mso-style-priority:99;
	mso-style-link:"Balloon Text";
	font-family:"Cambria","serif";}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1854564107;
	mso-list-type:hybrid;
	mso-list-template-ids:-1297980956 1368567296 67698713 67698715 67698703 67=
698713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:18.0pt;
	text-indent:-18.0pt;}
@list l0:level2
	{mso-level-number-format:ideograph-traditional;
	mso-level-text:%2\3001;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:48.0pt;
	text-indent:-24.0pt;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:72.0pt;
	text-indent:-24.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:96.0pt;
	text-indent:-24.0pt;}
@list l0:level5
	{mso-level-number-format:ideograph-traditional;
	mso-level-text:%5\3001;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:120.0pt;
	text-indent:-24.0pt;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:144.0pt;
	text-indent:-24.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:168.0pt;
	text-indent:-24.0pt;}
@list l0:level8
	{mso-level-number-format:ideograph-traditional;
	mso-level-text:%8\3001;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:192.0pt;
	text-indent:-24.0pt;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:216.0pt;
	text-indent:-24.0pt;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-TW" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:&quot;Calibri&quot;,&quot;sans-serif&quot;">Hi X</span><span lang=3D=
"EN-US" style=3D"font-size:10.0pt;font-family:&quot;Calibri&quot;,&quot;san=
s-serif&quot;">iuzhi</span><span lang=3D"EN-US" style=3D"font-size:10.0pt;f=
ont-family:&quot;Calibri&quot;,&quot;sans-serif&quot;">:<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:&quot;Calibri&quot;,&quot;sans-serif&quot;"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:&quot;Calibri&quot;,&quot;sans-serif&quot;">From your system log, I =
think the problem is on the Aspeed video driver(apsedd-video.c).<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:&quot;Calibri&quot;,&quot;sans-serif&quot;"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:&quot;Calibri&quot;,&quot;sans-serif&quot;">But I don&#8217;t have a=
ny Aspeed platforms at hand and can&#8217;t really help you to debug this i=
ssue,
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:&quot;Calibri&quot;,&quot;sans-serif&quot;">maybe you can increase t=
imeout value of mode detection or wait for Eddie&#8217;s comments.<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:&quot;Calibri&quot;,&quot;sans-serif&quot;"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:&quot;Calibri&quot;,&quot;sans-serif&quot;">If you want to auto star=
t/restart obmc-ikvm, you must add a service file for systemd service.<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:&quot;Calibri&quot;,&quot;sans-serif&quot;">You can refer to below l=
inks.<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:18.0pt;mso-para-margin-l=
eft:0gd;text-indent:-18.0pt;mso-list:l0 level1 lfo1">
<![if !supportLists]><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-fa=
mily:&quot;Calibri&quot;,&quot;sans-serif&quot;"><span style=3D"mso-list:Ig=
nore">1.<span style=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US" style=3D"font-size:10.0=
pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;">https://github.c=
om/openbmc/openbmc/blob/master/meta-phosphor/common/recipes-phosphor/interf=
aces/phosphor-gevent/phosphor-gevent.service
<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:18.0pt;mso-para-margin-l=
eft:0gd;text-indent:-18.0pt;mso-list:l0 level1 lfo1">
<![if !supportLists]><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-fa=
mily:&quot;Calibri&quot;,&quot;sans-serif&quot;"><span style=3D"mso-list:Ig=
nore">2.<span style=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US" style=3D"font-size:10.0=
pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;"><a href=3D"https=
://github.com/openbmc/openbmc/blob/master/meta-phosphor/common/recipes-phos=
phor/interfaces/phosphor-gevent.bb"><span style=3D"color:windowtext">https:=
//github.com/openbmc/openbmc/blob/master/meta-phosphor/common/recipes-phosp=
hor/interfaces/phosphor-gevent.bb</span></a><o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:18.0pt;mso-para-margin-l=
eft:0gd;text-indent:-18.0pt;mso-list:l0 level1 lfo1">
<![if !supportLists]><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-fa=
mily:&quot;Calibri&quot;,&quot;sans-serif&quot;"><span style=3D"mso-list:Ig=
nore">3.<span style=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US" style=3D"font-size:10.0=
pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;"><a href=3D"https=
://github.com/Nuvoton-Israel/meta-openbmc-nuvoton-addon/blob/openbmc-master=
/recipes-graphics/obmc-ikvm/obmc-ikvm/obmc-ikvm.service">https://github.com=
/Nuvoton-Israel/meta-openbmc-nuvoton-addon/blob/openbmc-master/recipes-grap=
hics/obmc-ikvm/obmc-ikvm/obmc-ikvm.service</a><o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:18.0pt;mso-para-margin-l=
eft:0gd;text-indent:-18.0pt;mso-list:l0 level1 lfo1">
<![if !supportLists]><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-fa=
mily:&quot;Calibri&quot;,&quot;sans-serif&quot;"><span style=3D"mso-list:Ig=
nore">4.<span style=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US" style=3D"font-size:10.0=
pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;"><a href=3D"https=
://github.com/Nuvoton-Israel/meta-openbmc-nuvoton-addon/blob/openbmc-master=
/recipes-graphics/obmc-ikvm/obmc-ikvm.bb">https://github.com/Nuvoton-Israel=
/meta-openbmc-nuvoton-addon/blob/openbmc-master/recipes-graphics/obmc-ikvm/=
obmc-ikvm.bb</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:&quot;Calibri&quot;,&quot;sans-serif&quot;"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:&quot;Calibri&quot;,&quot;sans-serif&quot;"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:&quot;Calibri&quot;,&quot;sans-serif&quot;">Thanks,<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:&quot;Calibri&quot;,&quot;sans-serif&quot;">Joseph<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:10.0pt;fo=
nt-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span =
lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:&quot;Tahoma&quot;,&qu=
ot;sans-serif&quot;"> xiuzhi [mailto:1450335857@qq.com]
<br>
<b>Sent:</b> Wednesday, September 05, 2018 1:48 PM<br>
<b>To:</b> IS20 Avi Fishman; CS20 KWLiu; Eddie James; Tanous, Ed; openbmc<b=
r>
<b>Subject:</b> Re:RE: Re:RE: KVM Support?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi&nbsp;</span><span lang=3D"EN=
-US" style=3D"font-size:9.0pt;font-family:&quot;Arial Narrow&quot;,&quot;sa=
ns-serif&quot;">&nbsp;Eddie,Joseph,</span><span lang=3D"EN-US"><o:p></o:p><=
/span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-f=
amily:&quot;Arial Narrow&quot;,&quot;sans-serif&quot;">&nbsp; &nbsp; The we=
bui can't get ikvm video when the host resolution changed&nbsp;.</span><spa=
n lang=3D"EN-US"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-f=
amily:&quot;Arial Narrow&quot;,&quot;sans-serif&quot;">I must kill the proc=
ess :python /usr/sbin/phosphor-gevent rest_dbus.py</span><span lang=3D"EN-U=
S"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-f=
amily:&quot;Arial Narrow&quot;,&quot;sans-serif&quot;">and restart obmc-ikv=
m -v /dev/video0 -i /dev/hidg0</span><span lang=3D"EN-US"><o:p></o:p></span=
></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-f=
amily:&quot;Arial Narrow&quot;,&quot;sans-serif&quot;">Then the kvm on webu=
i can get the host video image .</span><span lang=3D"EN-US"><o:p></o:p></sp=
an></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-f=
amily:&quot;Arial Narrow&quot;,&quot;sans-serif&quot;">The system log is:</=
span><span lang=3D"EN-US"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-f=
amily:&quot;Arial Narrow&quot;,&quot;sans-serif&quot;">&nbsp;&nbsp;[ 9052.9=
12683] aspeed-video 1e700000.video: resolution changed; resetting</span><sp=
an lang=3D"EN-US"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-f=
amily:&quot;Arial Narrow&quot;,&quot;sans-serif&quot;">[ 9054.406876] aspee=
d-video 1e700000.video: timed out on 1st mode detect</span><span lang=3D"EN=
-US"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-f=
amily:&quot;Arial Narrow&quot;,&quot;sans-serif&quot;">[ 9054.413380] aspee=
d-video 1e700000.video: resolution changed; couldn't get new resolution</sp=
an><span lang=3D"EN-US"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Do you have any idea to auto re=
start the obmc-ikvm and ?rest_dbus.py<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">xiuzhi<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-f=
amily:&quot;Arial Narrow&quot;,&quot;sans-serif&quot;">------------------&n=
bsp;Original&nbsp;------------------</span><span lang=3D"EN-US"><o:p></o:p>=
</span></p>
</div>
<div>
<div>
<div>
<p class=3D"MsoNormal" style=3D"background:#EFEFEF"><b><span lang=3D"EN-US"=
 style=3D"font-size:9.0pt">From:
</span></b><span lang=3D"EN-US" style=3D"font-size:9.0pt">&nbsp;&quot;Avi.F=
ishman&quot;;&lt;<a href=3D"mailto:Avi.Fishman@nuvoton.com">Avi.Fishman@nuv=
oton.com</a>&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"background:#EFEFEF"><b><span lang=3D"EN-US"=
 style=3D"font-size:9.0pt">Date:
</span></b><span lang=3D"EN-US" style=3D"font-size:9.0pt">&nbsp;Aug 29, 201=
8<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"background:#EFEFEF"><b><span lang=3D"EN-US"=
 style=3D"font-size:9.0pt">To:
</span></b><span lang=3D"EN-US" style=3D"font-size:9.0pt">&nbsp;&quot;KWLIU=
&quot;&lt;<a href=3D"mailto:KWLIU@nuvoton.com">KWLIU@nuvoton.com</a>&gt;; &=
quot;xiuzhi&quot;&lt;<a href=3D"mailto:1450335857@qq.com">1450335857@qq.com=
</a>&gt;; &quot;eajames&quot;&lt;<a href=3D"mailto:eajames@linux.vnet.ibm.c=
om">eajames@linux.vnet.ibm.com</a>&gt;;
 &quot;ed.tanous&quot;&lt;<a href=3D"mailto:ed.tanous@intel.com">ed.tanous@=
intel.com</a>&gt;; &quot;openbmc&quot;&lt;<a href=3D"mailto:openbmc@lists.o=
zlabs.org">openbmc@lists.ozlabs.org</a>&gt;;
<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"background:#EFEFEF"><b><span lang=3D"EN-US"=
 style=3D"font-size:9.0pt">Subject:
</span></b><span lang=3D"EN-US" style=3D"font-size:9.0pt">&nbsp;RE: Re:RE: =
KVM Support?<o:p></o:p></span></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US">Hi Xiuzhi,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US">Can you take the patches and merge them to yo=
ur environment?<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US">Josef,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US">Maybe you need to give the commit or tag you =
are that above it you use your patches?
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US">Thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US">Avi<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><b><span lang=3D"EN-US">From:</span></b><span lang=3D"EN-US"> open=
bmc &lt;<a href=3D"mailto:openbmc-bounces&#43;avifishman70=3Dgmail.com@list=
s.ozlabs.org">openbmc-bounces&#43;avifishman70=3Dgmail.com@lists.ozlabs.org=
</a>&gt;
<b>On Behalf Of </b>CS20 KWLiu<br>
<b>Sent:</b> Wednesday, August 29, 2018 5:44 AM<br>
<b>To:</b> <a href=3D"mailto:1450335857@qq.com">1450335857@qq.com</a>; <a h=
ref=3D"mailto:eajames@linux.vnet.ibm.com">
eajames@linux.vnet.ibm.com</a>; <a href=3D"mailto:ed.tanous@intel.com">ed.t=
anous@intel.com</a>;
<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br=
>
<b>Subject:</b> RE: Re:RE: KVM Support?<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US">Hi Xiuzhi:<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US">I think we are using different bases of the o=
penbmc, this patch is really working on my side<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US">Sorry for I cannot find the exact error in yo=
ur message.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US">Thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US">Joseph<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><b><span lang=3D"EN-US">From:</span></b><span lang=3D"EN-US"> xiuz=
hi [<a href=3D"mailto:1450335857@qq.com">mailto:1450335857@qq.com</a>]
<br>
<b>Sent:</b> Tuesday, August 28, 2018 6:57 PM<br>
<b>To:</b> Eddie James; Tanous, Ed; CS20 KWLiu; openbmc<br>
<b>Subject:</b> Re:RE: KVM Support?<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US">Hi Joseph, Ed,<br>
&nbsp; There was an error when I&nbsp; updated the patches <a href=3D"https=
://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_Nuvoton-2DIsra=
el_meta-2Dopenbmc-2Dnuvoton-2Daddon_commit_140771b7e898dd5ca8f0364290cce669=
609088ac&amp;d=3DDwMGAw&amp;c=3Due8mO8zgC4VZ4q_aNVKt8G9MC01UFDmisvMR1k-EoDM=
&amp;r=3D7g2D1XDc1ET3CnY1ySnaWQXPxPxfpLww1MiDbLW4v8Q&amp;m=3DZir4Lw7xIZbwLj=
Rk7ILcjDyeLfFVQzWjscAv2ZyvXXY&amp;s=3D8SWpZ_B0Z9GOpECKSppJKXXbMTo-hNO0HuXoc=
MRt5n0&amp;e=3D">
https://github.com/Nuvoton-Israel/meta-openbmc-nuvoton-addon/commit/140771b=
7e898dd5ca8f0364290cce669609088ac</a><o:p></o:p></span></p>
<pre><span lang=3D"EN-US">Would you like to give me some suggestions to deb=
ug it?<br>&nbsp;When I logged in <a href=3D"https://urldefense.proofpoint.c=
om/v2/url?u=3Dhttps-3A__-253cbmc-5Fip-253e_-23_kvm&amp;d=3DDwMFAg&amp;c=3Du=
e8mO8zgC4VZ4q_aNVKt8G9MC01UFDmisvMR1k-EoDM&amp;r=3DkNeU5gwNy2cOhaTMIUoFhUPA=
XV51uTneHprahPM6I78&amp;m=3DxFjehOYoJW0EsYnLWkBOLeUtOCSyAFs6UdQuMvfM7y4&amp=
;s=3D2J0BHCud5wpV8zxnLKS_sDp79AfVxVQvJ5Vk3r8dhTc&amp;e=3D">https://&lt;bmc_=
ip&gt;/#/kvm</a>, The errors read:<br>&quot;<br>WebSocket on-close event&nb=
sp; app.89eaa0b6e5e9417cb602.js:38:675915<br>Failed when connecting: Connec=
tion closed (code: 1005)&nbsp; app.89eaa0b6e5e9417cb602.js:38:685584<br>&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; RFB.prototype._fail <a href=3D"https://u=
rldefense.proofpoint.com/v2/url?u=3Dhttps-3A__192.168.120.132_app.89eaa0b6e=
5e9417cb602.js-3A38-3A685584&amp;d=3DDwMFAg&amp;c=3Due8mO8zgC4VZ4q_aNVKt8G9=
MC01UFDmisvMR1k-EoDM&amp;r=3DkNeU5gwNy2cOhaTMIUoFhUPAXV51uTneHprahPM6I78&am=
p;m=3DxFjehOYoJW0EsYnLWkBOLeUtOCSyAFs6UdQuMvfM7y4&amp;s=3DEgJDf5jL_gme8t1tF=
_wjg1-08xZxvqptSjoW3a8zohU&amp;e=3D">https://192.168.120.132/app.89eaa0b6e5=
e9417cb602.js:38:685584</a><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; RFB/&l=
t; <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__192.16=
8.120.132_app.89eaa0b6e5e9417cb602.js-3A38-3A676138&amp;d=3DDwMFAg&amp;c=3D=
ue8mO8zgC4VZ4q_aNVKt8G9MC01UFDmisvMR1k-EoDM&amp;r=3DkNeU5gwNy2cOhaTMIUoFhUP=
AXV51uTneHprahPM6I78&amp;m=3DxFjehOYoJW0EsYnLWkBOLeUtOCSyAFs6UdQuMvfM7y4&am=
p;s=3DdIWffzOhDWjQl-iTTJj_38z606ai7gLJSynBqbAZXW8&amp;e=3D">https://192.168=
.120.132/app.89eaa0b6e5e9417cb602.js:38:676138</a><br>&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &nbsp; Websock.prototype.open/this._websocket.onclose&lt; <a href=
=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__192.168.120.132_=
app.89eaa0b6e5e9417cb602.js-3A38-3A778159&amp;d=3DDwMFAg&amp;c=3Due8mO8zgC4=
VZ4q_aNVKt8G9MC01UFDmisvMR1k-EoDM&amp;r=3DkNeU5gwNy2cOhaTMIUoFhUPAXV51uTneH=
prahPM6I78&amp;m=3DxFjehOYoJW0EsYnLWkBOLeUtOCSyAFs6UdQuMvfM7y4&amp;s=3DoJ5y=
HA_oCl5ihumZXKGL7rDbby1iZ0j2J4hWMLB-hEY&amp;e=3D">https://192.168.120.132/a=
pp.89eaa0b6e5e9417cb602.js:38:778159</a><br>New state 'disconnecting', was =
'connecting'.&nbsp; app.89eaa0b6e5e9417cb602.js:38:684301<br>&gt;&gt; RFB.d=
isconnect&nbsp; app.89eaa0b6e5e9417cb602.js:38:680495<br>&gt;&gt; Keyboard.=
allKeysUp&nbsp; app.89eaa0b6e5e9417cb602.js:38:739659<br>&lt;&lt; Keyboard.=
allKeysUp&nbsp; app.89eaa0b6e5e9417cb602.js:38:739828<br>&quot;<br>The line=
 38 of app.89eaa0b6e5e9417cb602.js is :<br>void 0!=3D=3Dmodule&amp;&amp;voi=
d 0!=3D=3Dexports&amp;&amp;module.exports=3D=3D=3Dexports&amp;&amp;(module.=
exports=3D&quot;ui.router&quot;),function(window,angular,undefined){&quot;u=
se strict&quot;;var $$UMFP,isDefined=3Dangular.isDefined,isFunction=3Dangul=
ar.isFunction,isString=3Dangular.isString,isObject=3Dangular.isObject,isArr=
ay=3Dangular.isArray,forEach=3Dangular.forEach,extend=3Dangular.extend,copy=
=3Dangular.copy,toJson=3Dangular.toJson;function inherit(parent,extra){retu=
rn extend(new(extend(function(){},{prototype:parent})),extra)}function merg=
e(dst){return forEach(arguments,function(obj){obj!=3D=3Ddst&amp;&amp;forEac=
h(obj,function(value,key){dst.hasOwnProperty(key)||(dst[key]=3Dvalue)})}),d=
st}function objectKeys(object){if(Object.keys)return Object.keys(object);va=
r result=3D[];return forEach(object,function(val,key){result.push(key)}),re=
sult}function indexOf(array,value){if(Array.prototype.indexOf)return array.=
indexOf(value,Number(arguments[2])||0);var len=3Darray.length&gt;&gt;&gt;0,=
from=3DNumber(arguments[2])||0;for((from=3Dfrom&lt;0?Math.ceil(from):Math.f=
loor(from))&lt;0&amp;&amp;(from&#43;=3Dlen);from&lt;len;from&#43;&#43;)if(f=
rom in array&amp;&amp;array[from]=3D=3D=3Dvalue)return from;return-1}functi=
on inheritParams(currentParams,newParams,$current,$to) ... ...<br><br>Best,=
<br>Xiuzhi<br>&gt;Hi Eddie &amp; Ed:<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">&gt;Do you have any plan to support non-jpeg vide=
o stream in obmc-iKVM?<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">&gt;It is possible some platforms don't have hard=
ware JPEG engine, instead have the RGB video stream.<o:p></o:p></span></pre=
>
<pre><span lang=3D"EN-US">&gt;If possible to support RGB video stream, I th=
ink it would be better if you can add the video frame differentiation in ob=
mc-iKVM because we don't need to send the full screen &gt;to VNC client on =
every request, it can reduce the buffer size at least. (libvncserver alread=
y has the video frame differentiation)<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">&gt;Also, I have implemented a KVM application fo=
r our platform(nuvoton evb-npcm750) which has hardware video frame differen=
tiation and hardware hextile engine.<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US"><a href=3D"https://urldefense.proofpoint.com/v2/u=
rl?u=3Dhttps-3A__github.com_Nuvoton-2DIsrael_obmc-2Dikvm&amp;d=3DDwMGAw&amp=
;c=3Due8mO8zgC4VZ4q_aNVKt8G9MC01UFDmisvMR1k-EoDM&amp;r=3D7g2D1XDc1ET3CnY1yS=
naWQXPxPxfpLww1MiDbLW4v8Q&amp;m=3DZir4Lw7xIZbwLjRk7ILcjDyeLfFVQzWjscAv2ZyvX=
XY&amp;s=3D92D29zgWEhIBYgHR9Q7lkZzREnMSwnqyhl1nEMyqXFM&amp;e=3D">https://gi=
thub.com/Nuvoton-Israel/obmc-ikvm</a><o:p></o:p></span></pre>
<pre><span lang=3D"EN-US"><a href=3D"https://urldefense.proofpoint.com/v2/u=
rl?u=3Dhttps-3A__github.com_Nuvoton-2DIsrael_linux_commit_7e90f572323e56e94=
25b85aafe86dfa5a35c4e7d&amp;d=3DDwMGAw&amp;c=3Due8mO8zgC4VZ4q_aNVKt8G9MC01U=
FDmisvMR1k-EoDM&amp;r=3D7g2D1XDc1ET3CnY1ySnaWQXPxPxfpLww1MiDbLW4v8Q&amp;m=
=3DZir4Lw7xIZbwLjRk7ILcjDyeLfFVQzWjscAv2ZyvXXY&amp;s=3D1JBlTPOERz49VFrLgiw0=
14ZnBqab0r8xdRIe6Fee1JA&amp;e=3D">https://github.com/Nuvoton-Israel/linux/c=
ommit/7e90f572323e56e9425b85aafe86dfa5a35c4e7d</a><o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">&gt;I also enabled ED's KVM webui and added kvmws=
 proxy in python web server.<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US"><a href=3D"https://urldefense.proofpoint.com/v2/u=
rl?u=3Dhttps-3A__github.com_Nuvoton-2DIsrael_meta-2Dopenbmc-2Dnuvoton-2Dadd=
on_commit_140771b7e898dd5ca8f0364290cce669609088ac&amp;d=3DDwMGAw&amp;c=3Du=
e8mO8zgC4VZ4q_aNVKt8G9MC01UFDmisvMR1k-EoDM&amp;r=3D7g2D1XDc1ET3CnY1ySnaWQXP=
xPxfpLww1MiDbLW4v8Q&amp;m=3DZir4Lw7xIZbwLjRk7ILcjDyeLfFVQzWjscAv2ZyvXXY&amp=
;s=3D8SWpZ_B0Z9GOpECKSppJKXXbMTo-hNO0HuXocMRt5n0&amp;e=3D">https://github.c=
om/Nuvoton-Israel/meta-openbmc-nuvoton-addon/commit/140771b7e898dd5ca8f0364=
290cce669609088ac</a><o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">&gt;If you can spare a few minutes to review my i=
mplementation is my pleasure.<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">&gt;Currently, my video driver is not v4l2, so I =
am going to redesign it to fit v4l2 and your obmc-iKVM, then I will try to =
add the RGB format support in your obmc-ikvm.<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">&gt;Regarding the larger binary size, I think we =
need to review all configurations of libvncserver and check which functions=
 should be disabled.<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">&gt;Thanks,<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">&gt;Joseph Liu.<o:p></o:p></span></pre>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US"><br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
The privileged confidential information contained in this email is intended=
 for use only by the addressees as indicated by the original sender of this=
 email. If you are not the addressee indicated in this email or are not res=
ponsible for delivery of the email
 to such a person, please kindly reply to the sender indicating this fact a=
nd delete all copies of it from your computer and network server immediatel=
y. Your cooperation is highly appreciated. It is advised that any unauthori=
zed use of confidential information
 of Nuvoton is strictly prohibited; and any information in this email irrel=
evant to the official business of Nuvoton shall be deemed as neither given =
nor endorsed by Nuvoton.<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><br>
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Arial&quot;,&quot;sa=
ns-serif&quot;;color:black"><br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
The privileged confidential information contained in this email is intended=
 for use only by the addressees as indicated by the original sender of this=
 email. If you are not the addressee indicated in this email or are not res=
ponsible for delivery of the email
 to such a person, please kindly reply to the sender indicating this fact a=
nd delete all copies of it from your computer and network server immediatel=
y. Your cooperation is highly appreciated. It is advised that any unauthori=
zed use of confidential information
 of Nuvoton is strictly prohibited; and any information in this email irrel=
evant to the official business of Nuvoton shall be deemed as neither given =
nor endorsed by Nuvoton.</span><span lang=3D"EN-US"><o:p></o:p></span></p>
</div>
</div>
<br>
<font face=3D"Arial" color=3D"Black" size=3D"3"><br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
The privileged confidential information contained in this email is intended=
 for use only by the addressees as indicated by the original sender of this=
 email. If you are not the addressee indicated in this email or are not res=
ponsible for delivery of the email
 to such a person, please kindly reply to the sender indicating this fact a=
nd delete all copies of it from your computer and network server immediatel=
y. Your cooperation is highly appreciated. It is advised that any unauthori=
zed use of confidential information
 of Nuvoton is strictly prohibited; and any information in this email irrel=
evant to the official business of Nuvoton shall be deemed as neither given =
nor endorsed by Nuvoton.<br>
</font>
</body>
</html>

--_000_cc11de6844814426a96630c20fddaf46NTHCML01Anuvotoncom_--
