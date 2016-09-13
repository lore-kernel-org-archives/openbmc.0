Return-Path: <austenc@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sYd1P242NzDsTQ
 for <openbmc@lists.ozlabs.org>; Wed, 14 Sep 2016 07:22:32 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u8DLIUAC039153
 for <openbmc@lists.ozlabs.org>; Tue, 13 Sep 2016 17:22:30 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 25dxu57gwx-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 13 Sep 2016 17:22:30 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 13 Sep 2016 15:22:29 -0600
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 13 Sep 2016 15:22:28 -0600
X-IBM-Helo: d03dlp02.boulder.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 4386A3E40030
 for <openbmc@lists.ozlabs.org>; Tue, 13 Sep 2016 15:22:28 -0600 (MDT)
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u8DLMSpk14811514
 for <openbmc@lists.ozlabs.org>; Tue, 13 Sep 2016 14:22:28 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 09A0F78038
 for <openbmc@lists.ozlabs.org>; Tue, 13 Sep 2016 15:22:28 -0600 (MDT)
Received: from d50lp31.co.us.ibm.com (unknown [9.17.249.32])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS id F1EC57804D
 for <openbmc@lists.ozlabs.org>; Tue, 13 Sep 2016 15:22:27 -0600 (MDT)
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 13 Sep 2016 15:22:27 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.93)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-SHA bits=128/128)
 Tue, 13 Sep 2016 15:22:26 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: austenc@us.ibm.com
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 13 Sep 2016 21:22:25 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.39) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 13 Sep 2016 21:22:23 -0000
X-IBM-Helo: us1a3-smtp03.a3.dal06.isc4sb.com
X-IBM-MailFrom: austenc@us.ibm.com
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2016091321222264-461356 ;
 Tue, 13 Sep 2016 21:22:22 +0000 
Subject: Re: Interceptor for org.freedesktop.DBus.Properties.Set
In-Reply-To: <28a48a18-987a-31d8-2d3a-192be90884a4@linux.vnet.ibm.com>
From: "Chris Austen" <austenc@us.ibm.com>
To: vishwa@linux.vnet.ibm.com
Cc: openbmc@lists.ozlabs.org
Date: Tue, 13 Sep 2016 21:22:23 +0000
Sensitivity: 
MIME-Version: 1.0
References: <28a48a18-987a-31d8-2d3a-192be90884a4@linux.vnet.ibm.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 11776-754 | IBM Domino Build V851SAAS_08222016_FP3
 September 08, 2016
X-LLNOutbound: False
X-Disclaimed: 41451
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16091321-0016-0000-0000-000004A883D2
X-IBM-ISS-SpamDetectors: Score=0.397008; BY=0.23409; FL=0; FP=0; FZ=0; HX=0;
 KW=0; PH=0; SC=0.397008; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005756; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000185; SDB=6.00757376; UDB=6.00359143; UTC=2016-09-13
 21:22:24
x-cbparentid: 16091321-1800-0000-0000-0000008DC06C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00005756; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000185; SDB=6.00757376; UDB=6.00359143; IPR=6.00530770; 
 BA=6.00004718; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00012664; XFM=3.00000011;
 UTC=2016-09-13 21:22:29
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF816D7B69.CDDA10A7-ON0025802D.0075431F-0025802D.007567F2@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-09-13_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=12
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609020000
 definitions=main-1609130302
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
X-List-Received-Date: Tue, 13 Sep 2016 21:22:33 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div dir=3D"ltr" >What suggestions did you get back from #=
dbus?</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Making the properties read only and enabling access via a=
 method with specific validation seems reasonable.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><br><br>Chris Austen<br>POWER Systems Enablement Manager<=
br>(512) 286-5184 (T/L: 363-5184)</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: vishwa &lt;vishwa@=
linux.vnet.ibm.com&gt;<br>Sent by: "openbmc" &lt;openbmc-bounces+austenc=3D=
us.ibm.com@lists.ozlabs.org&gt;<br>To: OpenBMC Maillist &lt;openbmc@lists.o=
zlabs.org&gt;<br>Cc:<br>Subject: Interceptor for org.freedesktop.DBus.Prope=
rties.Set<br>Date: Tue, Sep 13, 2016 3:41 AM<br>&nbsp;<br><!--Notes ACF
<meta http-equiv=3D"content-type" content=3D"text/html; charset=3Dutf8" >--=
> <font size=3D"+1" >/org/openbmc/settings/host0 provides the dbus properti=
es that are settable via org.freedesktop.DBus.properties.Set.<br>The proper=
ties are treated as user settings and are consumed by respective daemons by=
 having a signal handler registered for PropertyChanged method.<br><br>The =
challenge at the hand is "How to make sure the users that set the property =
are choosing a valid value".<br><br>Since its set by org.freedesktop.DBus.P=
roperties.Set, the ideal way would be to register a callback that would val=
idate the user input based on custom algo and then only would let the .Set =
continue.<br><br>Without an interceptor, the user settings may be as junk a=
s "abcdef" and the *settings damon* can only react to that change and can p=
ut the previous value back into it post verification.<br><br>I did a lot of=
 search on ways to register an interceptor and did not see one. I then aske=
d in #dbus and they told me that there is no way to intercept that.<br><br>=
So the solution what I have at the moment is to<br><br>1) Disable the prope=
rty set via freedesktop<br>2) Introduce a custom Setter "org.openbmc.Settin=
gs.Host.Set" which can do the job of validating the inputs also.<br><br>Ple=
ase let me know if there are better approaches.<br><br>Thanks.<br><br>Vishw=
anatha Subbanna.</font>
<div><font size=3D"2" face=3D"Default Monospace,Courier New,Courier,monospa=
ce" >=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br=
>openbmc mailing list<br>openbmc@lists.ozlabs.org<br><a href=3D"https://lis=
ts.ozlabs.org/listinfo/openbmc" target=3D"=5Fblank" >https://lists.ozlabs.o=
rg/listinfo/openbmc</a></font></div></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>
