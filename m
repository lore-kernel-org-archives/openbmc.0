Return-Path: <vishwanath@in.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rDcXk0GNSzDq5y
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2016 00:01:57 +1000 (AEST)
Received: from pps.filterd (m0048817.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u4OCwl6m019187
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2016 09:04:00 -0400
Message-Id: <201605241304.u4OCwl6m019187@mx0a-001b2d01.pphosted.com>
Received: from e28smtp02.in.ibm.com (e28smtp02.in.ibm.com [125.16.236.2])
 by mx0a-001b2d01.pphosted.com with ESMTP id 234enaau82-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2016 09:04:00 -0400
Received: from localhost
 by e28smtp02.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Tue, 24 May 2016 18:33:55 +0530
Received: from d28dlp03.in.ibm.com (9.184.220.128)
 by e28smtp02.in.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 24 May 2016 18:33:53 +0530
X-IBM-Helo: d28dlp03.in.ibm.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d28relay04.in.ibm.com (d28relay04.in.ibm.com [9.184.220.61])
 by d28dlp03.in.ibm.com (Postfix) with ESMTP id 978AC1258060
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2016 18:36:09 +0530 (IST)
Received: from d50lp02.ny.us.ibm.com (d50lp02.pok.ibm.com [146.89.104.208])
 by d28relay04.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4OD3fRM18350354
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2016 18:33:42 +0530
Received: from localhost
 by d50lp02.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Tue, 24 May 2016 09:02:25 -0400
Received: from smtp.notes.na.collabserv.com (192.155.248.91)
 by d50lp02.ny.us.ibm.com (158.87.18.21) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Tue, 24 May 2016 09:02:23 -0400
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Tue, 24 May 2016 13:02:22 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.143) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 24 May 2016 13:02:15 -0000
Received: from us1a3-mail58.a3.dal09.isc4sb.com ([10.142.3.114])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2016052413021384-253761 ;
 Tue, 24 May 2016 13:02:13 +0000 
MIME-Version: 1.0
In-Reply-To: <20160524084041.14455-2-openbmc-patches@stwcx.xyz>
Subject: Re: [PATCH phosphor-host-ipmid] Returning correct value from
 handle_ipmid_command in ipmid.C
To: OpenBMC_Members@d28relay04.in.ibm.com
Cc: openbmc@lists.ozlabs.org, Nan Li <bjlinan@cn.ibm.com>
From: "Vishwanatha Subbanna" <vishwanath@in.ibm.com>
Date: Tue, 24 May 2016 18:32:12 +0530
References: <20160524084041.14455-1-openbmc-patches@stwcx.xyz>
 <20160524084041.14455-2-openbmc-patches@stwcx.xyz>
X-KeepSent: 01EF7029:00CA3F1D-65257FBD:00477DD6;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT September 15, 2015
X-LLNOutbound: False
X-Disclaimed: 47203
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=EABBF52EDFD4FB468f9e8a93df938690918cEABBF52EDFD4FB46"
x-cbid: 16052413-0004-0000-0000-000002867B68
X-IBM-ISS-SpamDetectors: Score=0.410717; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.410717; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005300; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000166; SDB=6.00706677; UDB=6.00327917; UTC=2016-05-24
 13:02:20
x-cbparentid: 16052413-4778-0000-0000-000006717845
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-05-24_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=12
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1605240156
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
X-List-Received-Date: Tue, 24 May 2016 14:01:58 -0000

--0__=EABBF52EDFD4FB468f9e8a93df938690918cEABBF52EDFD4FB46
Content-type: multipart/alternative; 
	Boundary="1__=EABBF52EDFD4FB468f9e8a93df938690918cEABBF52EDFD4FB46"


--1__=EABBF52EDFD4FB468f9e8a93df938690918cEABBF52EDFD4FB46
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


hello Nan Li,

I wonder if there is a github pull request for this ?

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



From:	OpenBMC Patches <openbmc-patches@stwcx.xyz>
To:	openbmc@lists.ozlabs.org
Cc:	Nan Li <bjlinan@cn.ibm.com>
Date:	24/05/2016 02:11 pm
Subject:	[PATCH phosphor-host-ipmid] Returning correct value from
            handle=5Fipmid=5Fcommand in ipmid.C
Sent by:	"openbmc" <openbmc-bounces
            +vishwanath=3Din.ibm.com@lists.ozlabs.org>



From: Nan Li <bjlinan@cn.ibm.com>

Instead of -1, we return 0xFF(Unspecified error) to the bus.

Signed-off-by: Nan Li <bjlinan@cn.ibm.com>
---
 ipmid.C | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/ipmid.C b/ipmid.C
index 728ba0b..9009cd6 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -267,6 +267,10 @@ static int handle=5Fipmi=5Fcommand(sd=5Fbus=5Fmessage =
*m, void
*user=5Fdata, sd=5Fbus=5Ferror
     if(r !=3D 0)
     {
         fprintf(stderr,"ERROR:[0x%X] handling NetFn:[0x%X],
Cmd:[0x%X]\n",r, netfn, cmd);
+
+        if(r =3D=3D -1) {
+           response[0] =3D IPMI=5FCC=5FUNSPECIFIED=5FERROR;
+        }
     }

     fprintf(ipmiio, "IPMI Response:\n");
--
2.8.3


=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
openbmc mailing list
openbmc@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/openbmc



--1__=EABBF52EDFD4FB468f9e8a93df938690918cEABBF52EDFD4FB46
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>hello Nan Li,<br><br>I wonder if there is a github pull requ=
est for this ?<br><br>Thanks<br><br>---------------------------------------=
----------------------------------------------<br>Thanks and Regards,<br>Vi=
shwanath.<br>Advisory Software Engineer,<br>Power Firmware Development, <br=
>Systems &amp;Technology Lab,<br>MG2-6F-255 , Manyata Embassy Business Park=
, <br>Bangalore , KA , 560045<br>Ph: +91-80-46678255<br>E-mail: vishwanath@=
in.ibm.com<br>-------------------------------------------------------------=
---------------------<br><br><img width=3D"16" height=3D"16" src=3D"cid:1=
=5F=5F=3DEABBF52EDFD4FB468f9e8a93df938690918cEAB@" border=3D"0" alt=3D"Inac=
tive hide details for OpenBMC Patches ---24/05/2016 02:11:43 pm---From: Nan=
 Li &lt;bjlinan@cn.ibm.com&gt; Instead of -1, we retur"><font color=3D"#424=
282">OpenBMC Patches ---24/05/2016 02:11:43 pm---From: Nan Li &lt;bjlinan@c=
n.ibm.com&gt; Instead of -1, we return 0xFF(Unspecified error) to the bus.<=
/font><br><br><font size=3D"2" color=3D"#5F5F5F">From:        </font><font =
size=3D"2">OpenBMC Patches &lt;openbmc-patches@stwcx.xyz&gt;</font><br><fon=
t size=3D"2" color=3D"#5F5F5F">To:        </font><font size=3D"2">openbmc@l=
ists.ozlabs.org</font><br><font size=3D"2" color=3D"#5F5F5F">Cc:        </f=
ont><font size=3D"2">Nan Li &lt;bjlinan@cn.ibm.com&gt;</font><br><font size=
=3D"2" color=3D"#5F5F5F">Date:        </font><font size=3D"2">24/05/2016 02=
:11 pm</font><br><font size=3D"2" color=3D"#5F5F5F">Subject:        </font>=
<font size=3D"2">[PATCH phosphor-host-ipmid] Returning correct value from h=
andle=5Fipmid=5Fcommand in ipmid.C</font><br><font size=3D"2" color=3D"#5F5=
F5F">Sent by:        </font><font size=3D"2">&quot;openbmc&quot; &lt;openbm=
c-bounces+vishwanath=3Din.ibm.com@lists.ozlabs.org&gt;</font><br><hr width=
=3D"100%" size=3D"2" align=3D"left" noshade style=3D"color:#8091A5; "><br><=
br><br><tt>From: Nan Li &lt;bjlinan@cn.ibm.com&gt;<br><br>Instead of -1, we=
 return 0xFF(Unspecified error) to the bus.<br><br>Signed-off-by: Nan Li &l=
t;bjlinan@cn.ibm.com&gt;<br>---<br> ipmid.C | 4 ++++<br> 1 file changed, 4 =
insertions(+)<br><br>diff --git a/ipmid.C b/ipmid.C<br>index 728ba0b..9009c=
d6 100644<br>--- a/ipmid.C<br>+++ b/ipmid.C<br>@@ -267,6 +267,10 @@ static =
int handle=5Fipmi=5Fcommand(sd=5Fbus=5Fmessage *m, void *user=5Fdata, sd=5F=
bus=5Ferror<br> &nbsp; &nbsp; if(r !=3D 0)<br> &nbsp; &nbsp; {<br> &nbsp; &=
nbsp; &nbsp; &nbsp; fprintf(stderr,&quot;ERROR:[0x%X] handling NetFn:[0x%X]=
, Cmd:[0x%X]\n&quot;,r, netfn, cmd);<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp;i=
f(r =3D=3D -1) {<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; response[0] =3D IP=
MI=5FCC=5FUNSPECIFIED=5FERROR;<br>+ &nbsp; &nbsp; &nbsp; &nbsp;}<br> &nbsp;=
 &nbsp; }<br> <br> &nbsp; &nbsp; fprintf(ipmiio, &quot;IPMI Response:\n&quo=
t;);<br>-- <br>2.8.3<br><br><br>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F<br>openbmc mailing list<br>openbmc@lists.ozlabs.or=
g<br></tt><tt><a href=3D"https://lists.ozlabs.org/listinfo/openbmc">https:/=
/lists.ozlabs.org/listinfo/openbmc</a></tt><tt><br></tt><br><br><BR>
</body></html>

--1__=EABBF52EDFD4FB468f9e8a93df938690918cEABBF52EDFD4FB46--


--0__=EABBF52EDFD4FB468f9e8a93df938690918cEABBF52EDFD4FB46
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=EABBF52EDFD4FB468f9e8a93df938690918cEAB@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=EABBF52EDFD4FB468f9e8a93df938690918cEABBF52EDFD4FB46--
