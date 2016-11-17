Return-Path: <shliyi@cn.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tK9h633rZzDvht
 for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2016 17:09:42 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 uAH69ArK073585
 for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2016 01:09:39 -0500
Received: from e23smtp05.au.ibm.com (e23smtp05.au.ibm.com [202.81.31.147])
 by mx0b-001b2d01.pphosted.com with ESMTP id 26rx2dm0qv-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2016 01:09:39 -0500
Received: from localhost
 by e23smtp05.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Thu, 17 Nov 2016 16:09:36 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp05.au.ibm.com (202.81.31.211) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 17 Nov 2016 16:09:34 +1000
X-IBM-Helo: d23dlp01.au.ibm.com
X-IBM-MailFrom: shliyi@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id C26052CE8054
 for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2016 17:09:33 +1100 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 uAH69X9o30605560
 for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2016 17:09:33 +1100
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 uAH69Xgf012070
 for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2016 17:09:33 +1100
Received: from e39.co.us.ibm.com (e39.boulder.ibm.com [9.17.249.49])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 uAH69VIL011996
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2016 17:09:33 +1100
Received: from localhost
 by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Wed, 16 Nov 2016 23:09:31 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.67)
 by e39.co.us.ibm.com (192.168.2.139) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-SHA bits=128/128)
 Wed, 16 Nov 2016 23:09:29 -0700
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Thu, 17 Nov 2016 06:09:28 -0000
Received: from us1a3-smtp08.a3.dal06.isc4sb.com (10.146.103.57)
 by smtp.notes.na.collabserv.com (10.106.227.16) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 17 Nov 2016 06:09:26 -0000
Received: from us1a3-mail141.a3.dal06.isc4sb.com ([10.146.38.85])
 by us1a3-smtp08.a3.dal06.isc4sb.com
 with ESMTP id 2016111706092551-373437 ;
 Thu, 17 Nov 2016 06:09:25 +0000 
MIME-Version: 1.0
In-Reply-To: <8d28c804-fef4-c66a-c472-0c7ddf4c3866@linux.vnet.ibm.com>
Subject: Re: D-Bus interfaces for FRU VPD inventory
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: "Yi TZ Li" <shliyi@cn.ibm.com>
Date: Thu, 17 Nov 2016 14:05:32 +0800
References: <0ec0dd36-c0c4-ac1e-6e7b-8dbb73196a78@linux.vnet.ibm.com>
 <OFBF350957.8F8AAB7A-ON4825806D.0037DBBB-4825806D.003B431A@notes.na.collabserv.com>
 <8d28c804-fef4-c66a-c472-0c7ddf4c3866@linux.vnet.ibm.com>
X-KeepSent: 9A69A5FC:380E5832-4825806E:0018DDCD;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT September 15, 2015
X-LLNOutbound: False
X-Disclaimed: 12735
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=C7BB0AFDDF8B5B5D8f9e8a93df938690918cC7BB0AFDDF8B5B5D"
Content-Disposition: inline
x-cbid: 16111706-0016-0000-0000-000001F1558C
X-IBM-ISS-SpamDetectors: Score=0.4332; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.4332; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00006092; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000189; SDB=6.00781793; UDB=6.00377170; UTC=2016-11-17
 06:09:27
x-cbparentid: 16111706-0328-0000-0000-0000019B314C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF9A69A5FC.380E5832-ON4825806E.0018DDCD-4825806E.0021777D@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-11-17_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1611170115
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
X-List-Received-Date: Thu, 17 Nov 2016 06:09:43 -0000


--0__=C7BB0AFDDF8B5B5D8f9e8a93df938690918cC7BB0AFDDF8B5B5D
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII

Thanks for the response.
Deepak Kodihalli <dkodihal@linux.vnet.ibm.com> wrote on 11/16/2016 08:29:17
PM:
>
> > Also there are other FRU items like PCIE card, HDD. How to handle them
> > in the new inventory framework?
>
> Do you mean handle their VPD (if any), or in general creating d-bus
> objects for them? I'm not sure about the latter.

There are some inventory items without VPD, e.g:

https://github.com/openbmc/skeleton/blob/master/configs/Barreleye.py#L133

"	'<inventory=5Froot>/system/chassis/io=5Fboard/pcie=5Fslot0=5Friser' :
{ 'fru=5Ftype' : 'PCIE=5FRISER', 'is=5Ffru' : True,},
	'<inventory=5Froot>/system/chassis/io=5Fboard/pcie=5Fslot1=5Friser' :
{ 'fru=5Ftype' : 'PCIE=5FRISER', 'is=5Ffru' : True,},
	'<inventory=5Froot>/system/chassis/io=5Fboard/pcie=5Fslot2=5Friser' :
{ 'fru=5Ftype' : 'PCIE=5FRISER', 'is=5Ffru' : True,},
	'<inventory=5Froot>/system/chassis/io=5Fboard/pcie=5Fslot0' :
{ 'fru=5Ftype' : 'PCIE=5FCARD', 'is=5Ffru' : True,},
	'<inventory=5Froot>/system/chassis/io=5Fboard/pcie=5Fslot1' :
{ 'fru=5Ftype' : 'PCIE=5FCARD', 'is=5Ffru' : True,},
	'<inventory=5Froot>/system/chassis/io=5Fboard/pcie=5Fslot2' :
{ 'fru=5Ftype' : 'PCIE=5FCARD', 'is=5Ffru' : True,},
	'<inventory=5Froot>/system/chassis/io=5Fboard/pcie=5Fmezz0' :
{ 'fru=5Ftype' : 'PCIE=5FCARD', 'is=5Ffru' : True,},
	'<inventory=5Froot>/system/chassis/io=5Fboard/pcie=5Fmezz1' :
{ 'fru=5Ftype' : 'PCIE=5FCARD', 'is=5Ffru' : True,},

"
Will the new inventory manager handle these items too? This looks like off
the topic.
But I saw your patch is divided into two groups:
"xyz/openbmc=5Fproject/Inventory", and "xyz/openpower/Inventory".
Where do we put the inventory items above?

Thanks,
-Yi

--0__=C7BB0AFDDF8B5B5D8f9e8a93df938690918cC7BB0AFDDF8B5B5D
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><tt>Thanks for the response. </tt><br><tt>Deepak Kodihalli &=
lt;dkodihal@linux.vnet.ibm.com&gt; wrote on 11/16/2016 08:29:17 PM:<br>&gt;=
 <br>&gt; &gt; Also there are other FRU items like PCIE card, HDD. How to h=
andle them<br>&gt; &gt; in the new inventory framework?<br>&gt; <br>&gt; Do=
 you mean handle their VPD (if any), or in general creating d-bus <br>&gt; =
objects for them? I'm not sure about the latter.<br></tt><br><tt>There are =
some inventory items without VPD, e.g:</tt><br><br><a href=3D"https://githu=
b.com/openbmc/skeleton/blob/master/configs/Barreleye.py#L133"><tt>https://g=
ithub.com/openbmc/skeleton/blob/master/configs/Barreleye.py#L133</tt></a><b=
r><br><tt>&quot;</tt><tt>        '&lt;inventory=5Froot&gt;/system/chassis/i=
o=5Fboard/pcie=5Fslot0=5Friser' : { 'fru=5Ftype' : 'PCIE=5FRISER', 'is=5Ffr=
u' : True,},</tt><br><tt>        '&lt;inventory=5Froot&gt;/system/chassis/i=
o=5Fboard/pcie=5Fslot1=5Friser' : { 'fru=5Ftype' : 'PCIE=5FRISER', 'is=5Ffr=
u' : True,},</tt><br><tt>        '&lt;inventory=5Froot&gt;/system/chassis/i=
o=5Fboard/pcie=5Fslot2=5Friser' : { 'fru=5Ftype' : 'PCIE=5FRISER', 'is=5Ffr=
u' : True,},</tt><br><tt>        '&lt;inventory=5Froot&gt;/system/chassis/i=
o=5Fboard/pcie=5Fslot0' : { 'fru=5Ftype' : 'PCIE=5FCARD', 'is=5Ffru' : True=
,},</tt><br><tt>        '&lt;inventory=5Froot&gt;/system/chassis/io=5Fboard=
/pcie=5Fslot1' :        { 'fru=5Ftype' : 'PCIE=5FCARD', 'is=5Ffru' : True,}=
,</tt><br><tt>        '&lt;inventory=5Froot&gt;/system/chassis/io=5Fboard/p=
cie=5Fslot2' :        { 'fru=5Ftype' : 'PCIE=5FCARD', 'is=5Ffru' : True,},<=
/tt><br><tt>        '&lt;inventory=5Froot&gt;/system/chassis/io=5Fboard/pci=
e=5Fmezz0' :        { 'fru=5Ftype' : 'PCIE=5FCARD', 'is=5Ffru' : True,},</t=
t><br><tt>        '&lt;inventory=5Froot&gt;/system/chassis/io=5Fboard/pcie=
=5Fmezz1' :        { 'fru=5Ftype' : 'PCIE=5FCARD', 'is=5Ffru' : True,},</tt=
><br><br><tt>&quot;</tt><br><tt>Will the new inventory manager handle these=
 items too? This looks like off the topic.</tt><br><tt>But I saw your patch=
 is divided into two groups: &quot;xyz/openbmc=5Fproject/Inventory&quot;, a=
nd &quot;xyz/openpower/Inventory&quot;.</tt><br><tt>Where do we put the inv=
entory items above? </tt><br><tt><br>Thanks,</tt><br><tt>-Yi</tt><BR>
</body></html>

--0__=C7BB0AFDDF8B5B5D8f9e8a93df938690918cC7BB0AFDDF8B5B5D--
