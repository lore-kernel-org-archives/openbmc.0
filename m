Return-Path: <vishwanath@in.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rVrKK1RsmzDqGs
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2016 03:41:23 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u5GHdO1t056049
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2016 13:41:19 -0400
Received: from e28smtp06.in.ibm.com (e28smtp06.in.ibm.com [125.16.236.6])
 by mx0b-001b2d01.pphosted.com with ESMTP id 23ktca0gr4-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2016 13:41:18 -0400
Received: from localhost
 by e28smtp06.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Thu, 16 Jun 2016 23:11:15 +0530
Received: from d28dlp02.in.ibm.com (9.184.220.127)
 by e28smtp06.in.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 16 Jun 2016 23:11:13 +0530
X-IBM-Helo: d28dlp02.in.ibm.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d28relay01.in.ibm.com (d28relay01.in.ibm.com [9.184.220.58])
 by d28dlp02.in.ibm.com (Postfix) with ESMTP id BE23A3940060
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2016 23:11:12 +0530 (IST)
Received: from d50lp31.co.us.ibm.com (d50lp31.boulder.ibm.com [9.17.249.32])
 by d28relay01.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u5GHfASn62652478
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2016 23:11:12 +0530
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Thu, 16 Jun 2016 11:41:10 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.72)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-SHA bits=128/128)
 Thu, 16 Jun 2016 11:41:08 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Thu, 16 Jun 2016 17:41:07 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 16 Jun 2016 17:41:05 -0000
X-IBM-Helo: us1a3-smtp02.a3.dal06.isc4sb.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from us1a3-mail58.a3.dal09.isc4sb.com ([10.142.3.114])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2016061617410352-431330 ;
 Thu, 16 Jun 2016 17:41:03 +0000 
MIME-Version: 1.0
Subject: Fw: Need some thoughts on systemd service file
To: openbmc@lists.ozlabs.org
From: "Vishwanatha Subbanna" <vishwanath@in.ibm.com>
Date: Thu, 16 Jun 2016 23:11:00 +0530
X-KeepSent: 27BAEC52:32D2FF79-65257FD4:0060E8C5;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT SHF692 April 27, 2016
X-LLNOutbound: False
X-Disclaimed: 58443
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=EABBF547DFF36E558f9e8a93df938690918cEABBF547DFF36E55"
Content-Disposition: inline
x-cbid: 16061617-0048-0000-0000-0000029B1A5D
X-IBM-ISS-SpamDetectors: Score=0.397008; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.397008; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005391; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000170; SDB=6.00717201; UDB=6.00334300; UTC=2016-06-16
 17:41:06
x-cbparentid: 16061617-6060-0000-0000-0000002871A6
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF27BAEC52.32D2FF79-ON65257FD4.0060E8C5-65257FD4.0061238B@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-06-16_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=5
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1606160191
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Jun 2016 17:41:26 -0000


--0__=EABBF547DFF36E558f9e8a93df938690918cEABBF547DFF36E55
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII



hello Team,

So here is what I am trying to do with :
https://github.com/vishwabmc/openbmc/commit/f28651bb92bc7af6b503c9ca07aa8d7=
6a3f0660c

1/. Point bb to the git repo with commit #
c69c3d30fd7d5fd04ba990788b6d75b19f275fc8 that introduced netman=5Fwatch=5Fd=
ns
binary
2/. Create 2 .service files inside
meta-phosphor/common/recipes-phosphor/network/files/ --> network.service
and network-update-dns.service
3/  Make necessary changes to bitbake file so systemd can enable the
services and start at boot.
4/. Build a Palmetto image ( or qemu too ) and copy 'em over to tftpserver
( /tftpboot/cuImage=5Fvishwa=5F1 and /tftpboot/initrd=5Fvishwa=5F1 )
5/. reboot palmetto and run netboot to new image.

I expected that the netman.py ( which is part of network.service ) and
netman=5Fwatch=5Fdns ( part of network-update-dns.service ) would get auto
started but they did *not* start and I need some thoughts on why this may
be happening.

https://lists.yoctoproject.org/pipermail/yocto/2015-April/024470.html
( Someone else also had same issue )

What is that I am seeing :

1/. I see these 2 files are actually inside /lib/systemd/system/network
Palmetto in as expected --> Good
2/. Services not started
3/. systemctl status network shows that its disabled. Same for update-dns.
4/. I see systemctl status skeleton displays everything is running
4.1/ Removing the Requires=3D and After=3D in network.service and booting to
that changed image still does not help.
5/. Manual start using systemctl start network -and/or- systemctl start
network-update-dns does everything okay and starts the expected services.
6/. No error seen in journal

Thanks

---------------------------------------------------------------------------=
----------

Thanks and Regards,
Vishwanath.
Advisory Software Engineer,
Power Firmware Development,
Systems &Technology Lab,
MG2-6F-255 , Manyata Embassy Business Park,
Bangalore , KA , 560045
Ph: +91-80-46678255
E-mail: vishwanath@in.ibm.com
---------------------------------------------------------------------------=
-------


--0__=EABBF547DFF36E558f9e8a93df938690918cEABBF547DFF36E55
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>hello Team,<br><br>So here is what I am trying to do with : =
<a href=3D"https://github.com/vishwabmc/openbmc/commit/f28651bb92bc7af6b503=
c9ca07aa8d76a3f0660c">https://github.com/vishwabmc/openbmc/commit/f28651bb9=
2bc7af6b503c9ca07aa8d76a3f0660c</a><br><br>1/. Point bb to the git repo wit=
h commit # <font size=3D"4">c69c3d30fd7d5fd04ba990788b6d75b19f275fc8</font>=
 that introduced netman=5Fwatch=5Fdns binary<br>2/. Create 2 .service files=
 inside <font size=3D"4">meta-phosphor/common/recipes-phosphor/network/</fo=
nt>files/ --&gt; network.service and network-update-dns.service<br>3/  Make=
 necessary changes to bitbake file so systemd can enable the services and s=
tart at boot.<br>4/. Build a Palmetto image ( or qemu too ) and copy 'em ov=
er to tftpserver ( /tftpboot/cuImage=5Fvishwa=5F1 and /tftpboot/initrd=5Fvi=
shwa=5F1 )<br>5/. reboot palmetto and run netboot to new image.<br><br>I ex=
pected that the netman.py ( which is part of network.service ) and netman=
=5Fwatch=5Fdns ( part of network-update-dns.service ) would get auto starte=
d but they did *not* start and I need some thoughts on why this may be happ=
ening.<br><br><a href=3D"https://lists.yoctoproject.org/pipermail/yocto/201=
5-April/024470.html"><font size=3D"5" color=3D"#0060A0" face=3D"Times-Roman=
">https://lists.yoctoproject.org/pipermail/yocto/2015-April/024470.html</fo=
nt></a>  ( Someone else also had same issue )<br><br>What is that I am seei=
ng :<br><br>1/. I see these 2 files are actually inside /lib/systemd/system=
/network Palmetto in as expected --&gt; Good<br>2/. Services not started<br=
>3/. <font color=3D"#0000FF">systemctl status network </font>shows that its=
 disabled. Same for update-dns.<br>4/. I see<font color=3D"#0000FF"> system=
ctl status skeleton</font> displays everything is running<br>4.1/ Removing =
the Requires=3D and After=3D in network.service and booting to that changed=
 image still does not help.<br>5/. Manual start using systemctl start netwo=
rk -and/or- systemctl start network-update-dns does everything okay and sta=
rts the expected services.<br>6/. No error seen in journal<br><br>Thanks<br=
><br>----------------------------------------------------------------------=
---------------<br>Thanks and Regards,<br>Vishwanath.<br>Advisory Software =
Engineer,<br>Power Firmware Development, <br>Systems &amp;Technology Lab,<b=
r>MG2-6F-255 , Manyata Embassy Business Park, <br>Bangalore , KA , 560045<b=
r>Ph: +91-80-46678255<br>E-mail: vishwanath@in.ibm.com<br>-----------------=
-----------------------------------------------------------------<br><br><B=
R>
</body></html>

--0__=EABBF547DFF36E558f9e8a93df938690918cEABBF547DFF36E55--
