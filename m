Return-Path: <njames@us.ibm.com>
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 1DAE91A02C4
 for <openbmc@lists.ozlabs.org>; Sun,  1 Nov 2015 09:00:43 +1100 (AEDT)
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Sat, 31 Oct 2015 18:00:39 -0400
Received: from d01dlp01.pok.ibm.com (9.56.250.166)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Sat, 31 Oct 2015 18:00:36 -0400
X-IBM-Helo: d01dlp01.pok.ibm.com
X-IBM-MailFrom: njames@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23])
 by d01dlp01.pok.ibm.com (Postfix) with ESMTP id 6632438C8059
 for <openbmc@lists.ozlabs.org>; Sat, 31 Oct 2015 18:00:36 -0400 (EDT)
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 t9VM0ala57081990
 for <openbmc@lists.ozlabs.org>; Sat, 31 Oct 2015 22:00:36 GMT
Received: from d01av03.pok.ibm.com (localhost [127.0.0.1])
 by d01av03.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 t9VM0Zxx007960
 for <openbmc@lists.ozlabs.org>; Sat, 31 Oct 2015 18:00:35 -0400
Received: from d50lp02.ny.us.ibm.com (d50lp02.pok.ibm.com [146.89.104.208])
 by d01av03.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 t9VM0XhX007667
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Sat, 31 Oct 2015 18:00:33 -0400
Message-Id: <201510312200.t9VM0XhX007667@d01av03.pok.ibm.com>
Received: from /spool/local
 by d50lp02.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Sat, 31 Oct 2015 18:00:33 -0400
Received: from smtp.notes.na.collabserv.com (192.155.248.82)
 by d50lp02.ny.us.ibm.com (158.87.18.21) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Sat, 31 Oct 2015 18:00:31 -0400
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Sat, 31 Oct 2015 22:00:30 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.100)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Sat, 31 Oct 2015 22:00:27 -0000
Received: from us1a3-mail62.a3.dal09.isc4sb.com ([10.142.3.202])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2015103122004077-161331 ;
 Sat, 31 Oct 2015 22:00:40 +0000 
In-Reply-To: <201510310517.t9V5HieN002544@d03av05.boulder.ibm.com>
Subject: Re: We have a candidate driver
To: "Chris Austen" <austenc@us.ibm.com>
Cc: openbmc@lists.ozlabs.org
From: "Norman James" <njames@us.ibm.com>
Date: Sat, 31 Oct 2015 07:15:15 -0600
References: <201510310517.t9V5HieN002544@d03av05.boulder.ibm.com>
X-KeepSent: B3800F50:38A46DB9-86257EEF:0048BE29;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP2 SHF37 August 25, 2014
X-LLNOutbound: False
X-Disclaimed: 38183
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=09BBF47CDFDB38B98f9e8a93df938690918c09BBF47CDFDB38B9"
x-cbid: 15103122-0057-0000-0000-00000230AD51
X-IBM-ISS-SpamDetectors: Score=0.410717; BY=0.133644; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.410717; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004554; HX=3.00000236; KW=3.00000007;
 PH=3.00000004; SC=3.00000120; SDB=6.00610820; UDB=6.00269726; UTC=2015-10-31
 22:00:28
x-cbparentid: 15103122-9900-0000-0000-000004B7D1AE
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sat, 31 Oct 2015 22:00:44 -0000

--0__=09BBF47CDFDB38B98f9e8a93df938690918c09BBF47CDFDB38B9
Content-type: multipart/alternative; 
	Boundary="1__=09BBF47CDFDB38B98f9e8a93df938690918c09BBF47CDFDB38B9"


--1__=09BBF47CDFDB38B98f9e8a93df938690918c09BBF47CDFDB38B9
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


Is the IPMI inventory handling in there?


Regards,
Norman James
IBM - POWER Systems Architect
Phone: 1-512-286-6807 (T/L: 363-6807)
Internet: njames@us.ibm.com




From:	Chris Austen/Austin/IBM@IBMUS
To:	openbmc@lists.ozlabs.org
Date:	10/31/2015 12:18 AM
Subject:	We have a candidate driver
Sent by:	"openbmc" <openbmc-bounces+njames=3Dus.ibm.com@lists.ozlabs.org>




Thanks to the hard work you all put in we now have a code level that can
power on without any patches.  It boots all the way to Petitboot.  There
are still some issues to resolve so please take time to check your emails
this weekend and stick around on irc.

Norm is flying on Monday to deliver the firmware to Foxconn and provide
some training on usage.  Take lots of notes Norm!

I need some help verifying that this image can boot beyond Petitboot and up
all the way to a real OS.  Any volunteers?


Palmetto Files for flashing this first candidate....
tftp server 9.3.164.219
/tftpboot/initrd=5F1031=5F2
/tftpboot/cuImage=5F1031=5F2


Chris Austen
POWER Systems Enablement Manager
(512) 286-5184 (T/L: 363-5184)
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
openbmc mailing list
openbmc@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/openbmc


--1__=09BBF47CDFDB38B98f9e8a93df938690918c09BBF47CDFDB38B9
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>Is the IPMI inventory handling in there?<br><br><br>Regards,=
<br>Norman James<br>IBM - POWER Systems Architect<br>Phone: 1-512-286-6807 =
(T/L: 363-6807)<br>Internet: njames@us.ibm.com<br><br><br><img width=3D"16"=
 height=3D"16" src=3D"cid:1=5F=5F=3D09BBF47CDFDB38B98f9e8a93df938690918c09B=
@" border=3D"0" alt=3D"Inactive hide details for Chris Austen---10/31/2015 =
12:18:00 AM---   Thanks to the hard work you all put in we now have a code =
"><font color=3D"#424282">Chris Austen---10/31/2015 12:18:00 AM---   Thanks=
 to the hard work you all put in we now have a code level that can power on=
 without any pat</font><br><br><font size=3D"2" color=3D"#5F5F5F">From:    =
    </font><font size=3D"2">Chris Austen/Austin/IBM@IBMUS</font><br><font s=
ize=3D"2" color=3D"#5F5F5F">To:        </font><font size=3D"2">openbmc@list=
s.ozlabs.org</font><br><font size=3D"2" color=3D"#5F5F5F">Date:        </fo=
nt><font size=3D"2">10/31/2015 12:18 AM</font><br><font size=3D"2" color=3D=
"#5F5F5F">Subject:        </font><font size=3D"2">We have a candidate drive=
r</font><br><font size=3D"2" color=3D"#5F5F5F">Sent by:        </font><font=
 size=3D"2">&quot;openbmc&quot; &lt;openbmc-bounces+njames=3Dus.ibm.com@lis=
ts.ozlabs.org&gt;</font><br><hr width=3D"100%" size=3D"2" align=3D"left" no=
shade style=3D"color:#8091A5; "><br><br><br><font face=3D"Arial"> </font><b=
r><font face=3D"Arial">Thanks to the hard work you all put in we now have a=
 code level that can power on without any patches.  It boots all the way to=
 Petitboot.  There are still some issues to resolve so please take time to =
check your emails this weekend and stick around on irc. </font><br><font fa=
ce=3D"Arial"> </font><br><font face=3D"Arial">Norm is flying on Monday to d=
eliver the firmware to Foxconn and provide some training on usage.  Take lo=
ts of notes Norm! </font><br><font face=3D"Arial"> </font><br><font face=3D=
"Arial">I need some help verifying that this image can boot beyond Petitboo=
t and up all the way to a real OS.  Any volunteers?</font><br><font face=3D=
"Arial"> </font><br><font face=3D"Arial"> </font><br><b><font face=3D"Arial=
">Palmetto Files for flashing this first candidate....</font></b><br><font =
face=3D"Arial">tftp server 9.3.164.219</font><br><font face=3D"Arial">/tftp=
boot/initrd=5F1031=5F2</font><br><font face=3D"Arial">/tftpboot/cuImage=5F1=
031=5F2</font><br><font face=3D"Arial">  </font><br><font face=3D"Arial"><b=
r>Chris Austen<br>POWER Systems Enablement Manager<br>(512) 286-5184 (T/L: =
363-5184)</font><br><tt>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F<br>openbmc mailing list<br>openbmc@lists.ozlabs.org<br></tt=
><tt><a href=3D"https://lists.ozlabs.org/listinfo/openbmc">https://lists.oz=
labs.org/listinfo/openbmc</a></tt><tt><br></tt><br><BR>
</body></html>

--1__=09BBF47CDFDB38B98f9e8a93df938690918c09BBF47CDFDB38B9--


--0__=09BBF47CDFDB38B98f9e8a93df938690918c09BBF47CDFDB38B9
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=09BBF47CDFDB38B98f9e8a93df938690918c09B@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=09BBF47CDFDB38B98f9e8a93df938690918c09BBF47CDFDB38B9--
