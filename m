Return-Path: <shyulei@cn.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t9SG5067YzDvYq
 for <openbmc@lists.ozlabs.org>; Sat,  5 Nov 2016 03:38:52 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 uA4GYKD7001730
 for <openbmc@lists.ozlabs.org>; Fri, 4 Nov 2016 12:38:50 -0400
Received: from e23smtp01.au.ibm.com (e23smtp01.au.ibm.com [202.81.31.143])
 by mx0a-001b2d01.pphosted.com with ESMTP id 26gsevd72x-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 04 Nov 2016 12:38:49 -0400
Received: from localhost
 by e23smtp01.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shyulei@cn.ibm.com>;
 Sat, 5 Nov 2016 02:38:47 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp01.au.ibm.com (202.81.31.207) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Sat, 5 Nov 2016 02:38:46 +1000
X-IBM-Helo: d23dlp03.au.ibm.com
X-IBM-MailFrom: shyulei@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay08.au.ibm.com (d23relay08.au.ibm.com [9.185.71.33])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id 8C4323578052
 for <openbmc@lists.ozlabs.org>; Sat,  5 Nov 2016 03:38:45 +1100 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 uA4Gcjnw8454238
 for <openbmc@lists.ozlabs.org>; Sat, 5 Nov 2016 03:38:45 +1100
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 uA4GcjCN015296
 for <openbmc@lists.ozlabs.org>; Sat, 5 Nov 2016 03:38:45 +1100
Received: from d50lp33.co.us.ibm.com (d50lp33.boulder.ibm.com [9.17.249.38])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 uA4GcgSv015285
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Sat, 5 Nov 2016 03:38:44 +1100
Received: from localhost
 by d50lp33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shyulei@cn.ibm.com>;
 Fri, 4 Nov 2016 10:38:42 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.72)
 by d50lp33.co.us.ibm.com (192.168.2.144) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-SHA bits=128/128)
 Fri, 4 Nov 2016 10:38:41 -0600
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <shyulei@cn.ibm.com>;
 Fri, 4 Nov 2016 16:38:40 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 4 Nov 2016 16:38:39 -0000
Received: from us1a3-mail202.a3.dal06.isc4sb.com ([10.146.77.228])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2016110416383800-309301 ;
 Fri, 4 Nov 2016 16:38:38 +0000 
In-Reply-To: 
Subject: How to handle GPIO differences between P8 and P9
From: "Lei KM Yu" <shyulei@cn.ibm.com>
To: openbmc@lists.ozlabs.org
Date: Fri, 4 Nov 2016 16:38:38 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 12475-850 | IBM Domino Build V851SAAS_10242016_FP2
 October 26, 2016
X-LLNOutbound: False
X-Disclaimed: 52443
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16110416-1617-0000-0000-000001750F3B
X-IBM-ISS-SpamDetectors: Score=0.40304; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.40304; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00006032; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000189; SDB=6.00776741; UDB=6.00373688; UTC=2016-11-04
 16:38:39
x-cbparentid: 16110416-6060-0000-0000-000002DC8C91
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF9CD90965.EF530142-ON00258061.0059B6B1-00258061.005B6DB9@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-11-04_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=10
 spamscore=10 suspectscore=2
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1611040314
X-Mailman-Approved-At: Sat, 05 Nov 2016 05:49:23 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Nov 2016 16:38:54 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><div class=3D"markdown-here-wrapper=
" data-md-url=3D"https://mail.notes.na.collabserv.com/verse" dir=3D"ltr" ma=
rkdown-here-wrapper-content-modified=3D"true" style=3D"" ><p style=3D"margi=
n: 0px 0px 1.2em ! important;" >Hi All,</p>
<p style=3D"margin: 0px 0px 1.2em ! important;" >This mail is to discuss ho=
w to handle GPIO differences (e.g. functionality, IN/OUT) between different=
 HWs.</p>
<p style=3D"margin: 0px 0px 1.2em ! important;" >I went into a case the P8 =
uses two GPIOs, but P9 does not use them: in <code style=3D"font-size: 0.85=
em; font-family: Consolas,Inconsolata,Courier,monospace;margin: 0px 0.15em;=
 padding: 0px 0.3em; white-space: pre-wrap; border: 1px solid rgb(234, 234,=
 234); background-color: rgb(248, 248, 248); border-radius: 3px; display: i=
nline;" >skeleton/op-hostctl/control=5Fhost=5Fobj.c</code>:</p>
<pre style=3D"font-size: 0.85em; font-family: Consolas,Inconsolata,Courier,=
monospace;font-size: 1em; line-height: 1.2em;margin: 1.2em 0px;" ><code sty=
le=3D"font-size: 0.85em; font-family: Consolas,Inconsolata,Courier,monospac=
e;margin: 0px 0.15em; padding: 0px 0.3em; white-space: pre-wrap; border: 1p=
x solid rgb(234, 234, 234); background-color: rgb(248, 248, 248); border-ra=
dius: 3px; display: inline;white-space: pre; overflow: auto; border-radius:=
 3px; border: 1px solid rgb(204, 204, 204); padding: 0.5em 0.7em; display: =
block ! important;" >GPIO Throttle =3D (GPIO){ "BMC=5FTHROTTLE" };

GPIO idbtn =3D (GPIO){ "IDBTN" };

...

rc |=3D gpio=5Fwrite(&amp;Throttle,1);

rc |=3D gpio=5Fwrite(&amp;idbtn,0);
</code></pre>
<p style=3D"margin: 0px 0px 1.2em ! important;" >In P9, <code style=3D"font=
-size: 0.85em; font-family: Consolas,Inconsolata,Courier,monospace;margin: =
0px 0.15em; padding: 0px 0.3em; white-space: pre-wrap; border: 1px solid rg=
b(234, 234, 234); background-color: rgb(248, 248, 248); border-radius: 3px;=
 display: inline;" >BMC=5FTHROTTLE</code> is renamed to <code style=3D"font=
-size: 0.85em; font-family: Consolas,Inconsolata,Courier,monospace;margin: =
0px 0.15em; padding: 0px 0.3em; white-space: pre-wrap; border: 1px solid rg=
b(234, 234, 234); background-color: rgb(248, 248, 248); border-radius: 3px;=
 display: inline;" >N=5FMODE=5FN</code>, and changed to an <code style=3D"f=
ont-size: 0.85em; font-family: Consolas,Inconsolata,Courier,monospace;margi=
n: 0px 0.15em; padding: 0px 0.3em; white-space: pre-wrap; border: 1px solid=
 rgb(234, 234, 234); background-color: rgb(248, 248, 248); border-radius: 3=
px; display: inline;" >IN</code> GPIO; <code style=3D"font-size: 0.85em; fo=
nt-family: Consolas,Inconsolata,Courier,monospace;margin: 0px 0.15em; paddi=
ng: 0px 0.3em; white-space: pre-wrap; border: 1px solid rgb(234, 234, 234);=
 background-color: rgb(248, 248, 248); border-radius: 3px; display: inline;=
" >IDBTN</code> is changed to <code style=3D"font-size: 0.85em; font-family=
: Consolas,Inconsolata,Courier,monospace;margin: 0px 0.15em; padding: 0px 0=
.3em; white-space: pre-wrap; border: 1px solid rgb(234, 234, 234); backgrou=
nd-color: rgb(248, 248, 248); border-radius: 3px; display: inline;" >IN</co=
de> GPIO as well.<br>If we keep the above code and overriding the GPIOs, wr=
iting <code style=3D"font-size: 0.85em; font-family: Consolas,Inconsolata,C=
ourier,monospace;margin: 0px 0.15em; padding: 0px 0.3em; white-space: pre-w=
rap; border: 1px solid rgb(234, 234, 234); background-color: rgb(248, 248, =
248); border-radius: 3px; display: inline;" >BMC=5FTHROTTLE</code> takes no=
 effect, but writing to <code style=3D"font-size: 0.85em; font-family: Cons=
olas,Inconsolata,Courier,monospace;margin: 0px 0.15em; padding: 0px 0.3em; =
white-space: pre-wrap; border: 1px solid rgb(234, 234, 234); background-col=
or: rgb(248, 248, 248); border-radius: 3px; display: inline;" >IDBTN</code>=
 may break the function of its related front panel button.</p>
<p style=3D"margin: 0px 0px 1.2em ! important;" >So I think we need to dist=
inguish such cases to avoid issues.</p>
<p style=3D"margin: 0px 0px 1.2em ! important;" >The question is, how to ch=
ange the code to support different HWs that have unique GPIOs?</p>
<p style=3D"margin: 0px 0px 1.2em ! important;" >=E2=80=94<br>Lei YU (=E9=
=83=81=E9=9B=B7)<br>IBM OpenPOWER Application Engineer<br>Tel: (86-21)6092-=
2710<br>E-Mail: shyulei@cn.ibm.com</p>
<div style=3D"height:0;width:0;max-height:0;max-width:0;overflow:hidden;fon=
t-size:0em;padding:0;margin:0;" title=3D"MDH:PGRpdj5IaSBBbGwsPGJyPjwvZGl2Pj=
xkaXY+PGJyPjwvZGl2PjxkaXY+VGhpcyBtYWlsIGlzIHRv
IGRpc2N1c3MgaG93IHRvIGhhbmRsZSBHUElPIGRpZmZlcmVuY2VzIChlLmcuIGZ1bmN0aW9uYWxp
dHksIElOL09VVCkgYmV0d2VlbiBkaWZmZXJlbnQgSFdzLjxicj48L2Rpdj48ZGl2Pjxicj48L2Rp
dj48ZGl2Pkkgd2VudCBpbnRvIGEgY2FzZSB0aGUgUDggdXNlcyB0d28gR1BJT3MsIGJ1dCBQOSBk
b2VzIG5vdCB1c2UgdGhlbTogaW4gYHNrZWxldG9uL29wLWhvc3RjdGwvY29udHJvbF9ob3N0X29i
ai5jYDo8YnI+PC9kaXY+PGRpdj5gYGA8YnI+PC9kaXY+PGRpdj48dGFibGUgY2xhc3M9ImhpZ2hs
aWdodCB0YWItc2l6ZSBqcy1maWxlLWxpbmUtY29udGFpbmVyIiBkYXRhLXRhYi1zaXplPSI4Ij48
dGJvZHk+PHRyPjx0ZCBpZD0iTEMyMyIgY2xhc3M9ImJsb2ItY29kZSBibG9iLWNvZGUtaW5uZXIg
anMtZmlsZS1saW5lIj5HUElPIFRocm90dGxlID0gKEdQSU8peyA8c3BhbiBjbGFzcz0icGwtcyI+
PHNwYW4gY2xhc3M9InBsLXBkcyI+Ijwvc3Bhbj5CTUNfVEhST1RUTEU8c3BhbiBjbGFzcz0icGwt
cGRzIj4iPC9zcGFuPjwvc3Bhbj4gfTs8L3RkPjwvdHI+PHRyPjwvdHI+PC90Ym9keT48L3RhYmxl
Pjx0YWJsZSBjbGFzcz0iaGlnaGxpZ2h0IHRhYi1zaXplIGpzLWZpbGUtbGluZS1jb250YWluZXIi
IGRhdGEtdGFiLXNpemU9IjgiPjx0Ym9keT48dHI+PHRkIGlkPSJMQzI0IiBjbGFzcz0iYmxvYi1j
b2RlIGJsb2ItY29kZS1pbm5lciBqcy1maWxlLWxpbmUiPkdQSU8gaWRidG4gPSAoR1BJTyl7IDxz
cGFuIGNsYXNzPSJwbC1zIj48c3BhbiBjbGFzcz0icGwtcGRzIj4iPC9zcGFuPklEQlROPHNwYW4g
Y2xhc3M9InBsLXBkcyI+Ijwvc3Bhbj48L3NwYW4+IH07PC90ZD48L3RyPjwvdGJvZHk+PC90YWJs
ZT48ZGl2Pi4uLjxicj48L2Rpdj48ZGl2Pjx0YWJsZSBjbGFzcz0iaGlnaGxpZ2h0IHRhYi1zaXpl
IGpzLWZpbGUtbGluZS1jb250YWluZXIiIGRhdGEtdGFiLXNpemU9IjgiPjx0Ym9keT48dHI+PHRk
IGlkPSJMQzEyMCIgY2xhc3M9ImJsb2ItY29kZSBibG9iLWNvZGUtaW5uZXIganMtZmlsZS1saW5l
Ij5yYyB8PSA8c3BhbiBjbGFzcz0icGwtYzEiPmdwaW9fd3JpdGU8L3NwYW4+KCZhbXA7VGhyb3R0
bGUsPHNwYW4gY2xhc3M9InBsLWMxIj4xPC9zcGFuPik7PC90ZD48L3RyPjx0cj48L3RyPjwvdGJv
ZHk+PC90YWJsZT48dGFibGUgY2xhc3M9ImhpZ2hsaWdodCB0YWItc2l6ZSBqcy1maWxlLWxpbmUt
Y29udGFpbmVyIiBkYXRhLXRhYi1zaXplPSI4Ij48dGJvZHk+PHRyPjx0ZCBpZD0iTEMxMjEiIGNs
YXNzPSJibG9iLWNvZGUgYmxvYi1jb2RlLWlubmVyIGpzLWZpbGUtbGluZSI+cmMgfD0gPHNwYW4g
Y2xhc3M9InBsLWMxIj5ncGlvX3dyaXRlPC9zcGFuPigmYW1wO2lkYnRuLDxzcGFuIGNsYXNzPSJw
bC1jMSI+MDwvc3Bhbj4pOzwvdGQ+PC90cj48L3Rib2R5PjwvdGFibGU+IDxicj48L2Rpdj48L2Rp
dj48ZGl2PmBgYDxicj48L2Rpdj48ZGl2PkluIFA5LCBgQk1DX1RIUk9UVExFYCBpcyByZW5hbWVk
IHRvIGBOX01PREVfTmAsIGFuZCBjaGFuZ2VkIHRvIGFuIGBJTmAgR1BJTzsgYElEQlROYCBpcyBj
aGFuZ2VkIHRvIGBJTmAgR1BJTyBhcyB3ZWxsLjxicj48L2Rpdj48ZGl2PklmIHdlIGtlZXAgdGhl
IGFib3ZlIGNvZGUgYW5kIG92ZXJyaWRpbmcgdGhlIEdQSU9zLCAgd3JpdGluZyBgQk1DX1RIUk9U
VExFYCB0YWtlcyBubyBlZmZlY3QsIGJ1dCB3cml0aW5nIHRvIGBJREJUTmAgbWF5IGJyZWFrIHRo
ZSBmdW5jdGlvbiBvZiBpdHMgcmVsYXRlZCBmcm9udCBwYW5lbCBidXR0b24uPGJyPjwvZGl2Pjxk
aXY+PGJyPjwvZGl2PjxkaXY+U28gSSB0aGluayB3ZSBuZWVkIHRvIGRpc3Rpbmd1aXNoIHN1Y2gg
Y2FzZXMgdG8gYXZvaWQgaXNzdWVzLjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlRoZSBx
dWVzdGlvbiBpcywgaG93IHRvIGNoYW5nZSB0aGUgY29kZSB0byBzdXBwb3J0IGRpZmZlcmVudCBI
V3MgdGhhdCBoYXZlIHVuaXF1ZSBHUElPcz88YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdiBj
bGFzcz0ibWFpbC1zaWduYXR1cmUtY29udGFpbmVyIj48ZGl2IGNsYXNzPSJzb2NtYWlsZGVmYXVs
dGZvbnQiIGRpcj0ibHRyIiBzdHlsZT0iZm9udC1mYW1pbHk6JnF1b3Q7SGVsdmV0aWNhIE5ldWUm
cXVvdDssIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWY7Zm9udC1zaXplOjEwLjVwdCI+PGRp
diBjbGFzcz0ic29jbWFpbGRlZmF1bHRmb250IiBkaXI9Imx0ciIgc3R5bGU9ImZvbnQtZmFtaWx5
OiZxdW90O0hlbHZldGljYSBOZXVlJnF1b3Q7LCBIZWx2ZXRpY2EsIEFyaWFsLCBzYW5zLXNlcmlm
O2ZvbnQtc2l6ZToxMC41cHQiPjxkaXYgZGlyPSJsdHIiPi0tPGJyPjwvZGl2PjxkaXYgZGlyPSJs
dHIiPkxlaSBZVSAo6YOB6Zu3KTxicj5JQk0gT3BlblBPV0VSIEFwcGxpY2F0aW9uIEVuZ2luZWVy
PGJyPlRlbDogKDg2LTIxKTYwOTItMjcxMDxicj5FLU1haWw6IHNoeXVsZWlAY24uaWJtLmNvbTxi
cj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj4=3D" >=E2=80=8B</div></div></div><BR>
