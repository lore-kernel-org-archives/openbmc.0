Return-Path: <shliyi@cn.ibm.com>
Received: from e23smtp05.au.ibm.com (e23smtp05.au.ibm.com [202.81.31.147])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 77D0C1A01E7
 for <openbmc@lists.ozlabs.org>; Mon,  7 Dec 2015 03:22:39 +1100 (AEDT)
Received: from localhost
 by e23smtp05.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Mon, 7 Dec 2015 02:22:38 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp05.au.ibm.com (202.81.31.211) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 7 Dec 2015 02:22:36 +1000
X-IBM-Helo: d23dlp01.au.ibm.com
X-IBM-MailFrom: shliyi@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 98AB32CE8050
 for <openbmc@lists.ozlabs.org>; Mon,  7 Dec 2015 03:22:35 +1100 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tB6GMRKm52101348
 for <openbmc@lists.ozlabs.org>; Mon, 7 Dec 2015 03:22:35 +1100
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tB6GM3fT020626
 for <openbmc@lists.ozlabs.org>; Mon, 7 Dec 2015 03:22:03 +1100
Received: from d50lp01.ny.us.ibm.com ([146.89.104.207])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tB6GM065020235
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Mon, 7 Dec 2015 03:22:02 +1100
Message-Id: <201512061622.tB6GM065020235@d23av03.au.ibm.com>
Received: from /spool/local
 by d50lp01.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Sun, 6 Dec 2015 11:21:02 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.91)
 by d50lp01.ny.us.ibm.com (158.87.18.20) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Sun, 6 Dec 2015 11:21:01 -0500
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Sun, 6 Dec 2015 16:21:00 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.94)
 by smtp.notes.na.collabserv.com (10.106.227.143) with
 smtp.notes.na.collabserv.com ESMTP; Sun, 6 Dec 2015 16:20:57 -0000
Received: from us1a3-mail141.a3.dal06.isc4sb.com ([10.146.38.85])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2015120616215952-77017 ;
 Sun, 6 Dec 2015 16:21:59 +0000 
In-Reply-To: <5658043F.8020309@ozlabs.org>
Subject: Re: [PATCH linux] Add BMC HWMON driver to kernel. Format patch based
 on Joel's comments.
To: Jeremy Kerr <jk@ozlabs.org>
Cc: openbmc@lists.ozlabs.org, adamliyi <adamliyi@msn.com>
From: "Yi TZ Li" <shliyi@cn.ibm.com>
Date: Mon, 7 Dec 2015 00:20:21 +0800
References: <1448604027-22820-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1448604027-22820-2-git-send-email-openbmc-patches@stwcx.xyz>
 <5658043F.8020309@ozlabs.org>
X-KeepSent: CC585B80:65B82A4B-00257F11:005202B7;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1SHF211 December 19, 2013
X-LLNOutbound: False
X-Disclaimed: 2567
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=8FBBF582DFC184278f9e8a93df938690918c8FBBF582DFC18427"
x-cbid: 15120616-0017-0000-0000-00000259BCB0
X-IBM-ISS-SpamDetectors: Score=0.410717; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.410717; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004641; HX=3.00000236; KW=3.00000007;
 PH=3.00000004; SC=3.00000122; SDB=6.00627092; UDB=6.00279903; UTC=2015-12-06
 16:20:59
x-cbparentid: 15120616-4778-0000-0000-000001218A29
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
X-List-Received-Date: Sun, 06 Dec 2015 16:22:39 -0000

--0__=8FBBF582DFC184278f9e8a93df938690918c8FBBF582DFC18427
Content-type: multipart/alternative; 
	Boundary="1__=8FBBF582DFC184278f9e8a93df938690918c8FBBF582DFC18427"


--1__=8FBBF582DFC184278f9e8a93df938690918c8FBBF582DFC18427
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII

Hi Jeremy,

Thanks many for your review and comments.

I made changes to the driver according to your comments, with bellow
exceptions:

"openbmc" <openbmc-bounces+shliyi=3Dcn.ibm.com@lists.ozlabs.org> wrote on
11/27/2015 03:20:31 PM:

> From: Jeremy Kerr <jk@ozlabs.org>
> To: openbmc@lists.ozlabs.org
> Cc: adamliyi <adamliyi@msn.com>
> Date: 11/27/2015 03:20 PM
> Subject: Re: [PATCH linux] Add BMC HWMON driver to kernel. Format
> patch based on Joel's comments.
> Sent by: "openbmc" <openbmc-bounces+shliyi=3Dcn.ibm.com@lists.ozlabs.org>
>
> Hi Adam,
>
> Thanks for v2. Some further comments:
>

>
> > +         (const char *)&d[dnum], 4);
> > +      o->data.blocks[b].reserved0 =3D d[dnum+4];
> > +      o->data.blocks[b].sensor=5Fformat =3D d[dnum+5];
> > +      o->data.blocks[b].sensor=5Flength =3D d[dnum+6];
> > +      o->data.blocks[b].num=5Fof=5Fsensors =3D d[dnum+7];
> > +      dnum =3D dnum + 8;
>
> More magic numbers. Can we just use a struct assignment for things like
> this?
>
I agree these magic numbers are ugly. However, using struct assignemt would
need to take care of structure element alignment and endianess. In my new
code, I used

"
                                                             =20
 + memcpy(&o->header, &d[RESP=5FHEADER=5FOFFSET], sizeof(o->     =20
 header));                                                   =20
                                                             =20
                                                             =20
                                                             =20


                               =20
                               =20
                               =20
 + o->                         =20
 header.error=5Flog=5Faddr=5Fstart =3D =20
                               =20
                               =20
                               =20



                                             =20
                                             =20
                                             =20
 + be32=5Fto=5Fcpu(o->                           =20
 header.error=5Flog=5Faddr=5Fstart);               =20
                                             =20
                                             =20
                                             =20



                                                          =20
 + o->header.error=5Flog=5Flength =3D be16=5Fto=5Fcpu(o->           =20
 header.error=5Flog=5Flength);                                =20
                                                          =20


"
to replace a 45-byte data block parsing.
For this 8-byte data parsing, I'd prefer to parse them one-by-one, since it
looks more easy to understand.

>
>
> > +static struct sensor=5Fdevice=5Fattribute temp=5Finput[] =3D {
> > +   SENSOR=5FATTR(temp1=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput, =
NULL, 1),
> > +   SENSOR=5FATTR(temp2=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput, =
NULL, 2),
> > +   SENSOR=5FATTR(temp3=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput, =
NULL, 3),
> > +   SENSOR=5FATTR(temp4=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput, =
NULL, 4),
> > +   SENSOR=5FATTR(temp5=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput, =
NULL, 5),
> > +   SENSOR=5FATTR(temp6=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput, =
NULL, 6),
> > +   SENSOR=5FATTR(temp7=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput, =
NULL, 7),
> > +   SENSOR=5FATTR(temp8=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput, =
NULL, 8),
> > +   SENSOR=5FATTR(temp9=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput, =
NULL, 9),
> > +   SENSOR=5FATTR(temp10=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput,=
 NULL, 10),
> > +   SENSOR=5FATTR(temp11=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput,=
 NULL, 11),
> > +   SENSOR=5FATTR(temp12=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput,=
 NULL, 12),
> > +   SENSOR=5FATTR(temp13=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput,=
 NULL, 13),
> > +   SENSOR=5FATTR(temp14=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput,=
 NULL, 14),
> > +   SENSOR=5FATTR(temp15=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput,=
 NULL, 15),
> > +   SENSOR=5FATTR(temp16=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput,=
 NULL, 16),
> > +   SENSOR=5FATTR(temp17=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput,=
 NULL, 17),
> > +   SENSOR=5FATTR(temp18=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput,=
 NULL, 18),
> > +   SENSOR=5FATTR(temp19=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput,=
 NULL, 19),
> > +   SENSOR=5FATTR(temp20=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput,=
 NULL, 20),
> > +   SENSOR=5FATTR(temp21=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput,=
 NULL, 21),
> > +   SENSOR=5FATTR(temp22=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput,=
 NULL, 22),
> > +};
> > +
> > +static struct sensor=5Fdevice=5Fattribute temp=5Flabel[] =3D {
> > +   SENSOR=5FATTR(temp1=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel, =
NULL, 1),
> > +   SENSOR=5FATTR(temp2=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel, =
NULL, 2),
> > +   SENSOR=5FATTR(temp3=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel, =
NULL, 3),
> > +   SENSOR=5FATTR(temp4=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel, =
NULL, 4),
> > +   SENSOR=5FATTR(temp5=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel, =
NULL, 5),
> > +   SENSOR=5FATTR(temp6=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel, =
NULL, 6),
> > +   SENSOR=5FATTR(temp7=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel, =
NULL, 7),
> > +   SENSOR=5FATTR(temp8=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel, =
NULL, 8),
> > +   SENSOR=5FATTR(temp9=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel, =
NULL, 9),
> > +   SENSOR=5FATTR(temp10=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel,=
 NULL, 10),
> > +   SENSOR=5FATTR(temp11=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel,=
 NULL, 11),
> > +   SENSOR=5FATTR(temp12=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel,=
 NULL, 12),
> > +   SENSOR=5FATTR(temp13=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel,=
 NULL, 13),
> > +   SENSOR=5FATTR(temp14=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel,=
 NULL, 14),
> > +   SENSOR=5FATTR(temp15=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel,=
 NULL, 15),
> > +   SENSOR=5FATTR(temp16=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel,=
 NULL, 16),
> > +   SENSOR=5FATTR(temp17=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel,=
 NULL, 17),
> > +   SENSOR=5FATTR(temp18=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel,=
 NULL, 18),
> > +   SENSOR=5FATTR(temp19=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel,=
 NULL, 19),
> > +   SENSOR=5FATTR(temp20=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel,=
 NULL, 20),
> > +   SENSOR=5FATTR(temp21=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel,=
 NULL, 21),
> > +   SENSOR=5FATTR(temp22=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel,=
 NULL, 22),
> > +
> > +};
> > +
> > +#define TEMP=5FUNIT=5FATTRS(X)                      \
> > +{   &temp=5Finput[X].dev=5Fattr.attr,           \
> > +   &temp=5Flabel[X].dev=5Fattr.attr,          \
> > +   NULL                                    \
> > +}
> > +
> > +/* 10-core CPU, occ has 22 temp sensors, more socket, more sensors */
> > +static struct attribute *occ=5Ftemp=5Fattr[][3] =3D {
> > +   TEMP=5FUNIT=5FATTRS(0),
> > +   TEMP=5FUNIT=5FATTRS(1),
> > +   TEMP=5FUNIT=5FATTRS(2),
> > +   TEMP=5FUNIT=5FATTRS(3),
> > +   TEMP=5FUNIT=5FATTRS(4),
> > +   TEMP=5FUNIT=5FATTRS(5),
> > +   TEMP=5FUNIT=5FATTRS(6),
> > +   TEMP=5FUNIT=5FATTRS(7),
> > +   TEMP=5FUNIT=5FATTRS(8),
> > +   TEMP=5FUNIT=5FATTRS(9),
> > +   TEMP=5FUNIT=5FATTRS(10),
> > +   TEMP=5FUNIT=5FATTRS(11),
> > +   TEMP=5FUNIT=5FATTRS(12),
> > +   TEMP=5FUNIT=5FATTRS(13),
> > +   TEMP=5FUNIT=5FATTRS(14),
> > +   TEMP=5FUNIT=5FATTRS(15),
> > +   TEMP=5FUNIT=5FATTRS(16),
> > +   TEMP=5FUNIT=5FATTRS(17),
> > +   TEMP=5FUNIT=5FATTRS(18),
> > +   TEMP=5FUNIT=5FATTRS(19),
> > +   TEMP=5FUNIT=5FATTRS(20),
> > +   TEMP=5FUNIT=5FATTRS(21),
> > +};
> > +
> > +static const struct attribute=5Fgroup occ=5Ftemp=5Fattr=5Fgroup[] =3D {
> > +   { .attrs =3D occ=5Ftemp=5Fattr[0] },
> > +   { .attrs =3D occ=5Ftemp=5Fattr[1] },
> > +   { .attrs =3D occ=5Ftemp=5Fattr[2] },
> > +   { .attrs =3D occ=5Ftemp=5Fattr[3] },
> > +   { .attrs =3D occ=5Ftemp=5Fattr[4] },
> > +   { .attrs =3D occ=5Ftemp=5Fattr[5] },
> > +   { .attrs =3D occ=5Ftemp=5Fattr[6] },
> > +   { .attrs =3D occ=5Ftemp=5Fattr[7] },
> > +   { .attrs =3D occ=5Ftemp=5Fattr[8] },
> > +   { .attrs =3D occ=5Ftemp=5Fattr[9] },
> > +   { .attrs =3D occ=5Ftemp=5Fattr[10] },
> > +   { .attrs =3D occ=5Ftemp=5Fattr[11] },
> > +   { .attrs =3D occ=5Ftemp=5Fattr[12] },
> > +   { .attrs =3D occ=5Ftemp=5Fattr[13] },
> > +   { .attrs =3D occ=5Ftemp=5Fattr[14] },
> > +   { .attrs =3D occ=5Ftemp=5Fattr[15] },
> > +   { .attrs =3D occ=5Ftemp=5Fattr[16] },
> > +   { .attrs =3D occ=5Ftemp=5Fattr[17] },
> > +   { .attrs =3D occ=5Ftemp=5Fattr[18] },
> > +   { .attrs =3D occ=5Ftemp=5Fattr[19] },
> > +   { .attrs =3D occ=5Ftemp=5Fattr[20] },
> > +   { .attrs =3D occ=5Ftemp=5Fattr[21] },
> > +};
> > +
> > +
> > +static struct sensor=5Fdevice=5Fattribute freq=5Finput[] =3D {
> > +   SENSOR=5FATTR(freq1=5Finput, S=5FIRUGO, show=5Focc=5Ffreq=5Finput, =
NULL, 1),
> > +   SENSOR=5FATTR(freq2=5Finput, S=5FIRUGO, show=5Focc=5Ffreq=5Finput, =
NULL, 2),
> > +   SENSOR=5FATTR(freq3=5Finput, S=5FIRUGO, show=5Focc=5Ffreq=5Finput, =
NULL, 3),
> > +   SENSOR=5FATTR(freq4=5Finput, S=5FIRUGO, show=5Focc=5Ffreq=5Finput, =
NULL, 4),
> > +   SENSOR=5FATTR(freq5=5Finput, S=5FIRUGO, show=5Focc=5Ffreq=5Finput, =
NULL, 5),
> > +   SENSOR=5FATTR(freq6=5Finput, S=5FIRUGO, show=5Focc=5Ffreq=5Finput, =
NULL, 6),
> > +   SENSOR=5FATTR(freq7=5Finput, S=5FIRUGO, show=5Focc=5Ffreq=5Finput, =
NULL, 7),
> > +   SENSOR=5FATTR(freq8=5Finput, S=5FIRUGO, show=5Focc=5Ffreq=5Finput, =
NULL, 8),
> > +   SENSOR=5FATTR(freq9=5Finput, S=5FIRUGO, show=5Focc=5Ffreq=5Finput, =
NULL, 9),
> > +   SENSOR=5FATTR(freq10=5Finput, S=5FIRUGO, show=5Focc=5Ffreq=5Finput,=
 NULL, 10),
> > +};
> > +
> > +static struct sensor=5Fdevice=5Fattribute freq=5Flabel[] =3D {
> > +   SENSOR=5FATTR(freq1=5Flabel, S=5FIRUGO, show=5Focc=5Ffreq=5Flabel, =
NULL, 1),
> > +   SENSOR=5FATTR(freq2=5Flabel, S=5FIRUGO, show=5Focc=5Ffreq=5Flabel, =
NULL, 2),
> > +   SENSOR=5FATTR(freq3=5Flabel, S=5FIRUGO, show=5Focc=5Ffreq=5Flabel, =
NULL, 3),
> > +   SENSOR=5FATTR(freq4=5Flabel, S=5FIRUGO, show=5Focc=5Ffreq=5Flabel, =
NULL, 4),
> > +   SENSOR=5FATTR(freq5=5Flabel, S=5FIRUGO, show=5Focc=5Ffreq=5Flabel, =
NULL, 5),
> > +   SENSOR=5FATTR(freq6=5Flabel, S=5FIRUGO, show=5Focc=5Ffreq=5Flabel, =
NULL, 6),
> > +   SENSOR=5FATTR(freq7=5Flabel, S=5FIRUGO, show=5Focc=5Ffreq=5Flabel, =
NULL, 7),
> > +   SENSOR=5FATTR(freq8=5Flabel, S=5FIRUGO, show=5Focc=5Ffreq=5Flabel, =
NULL, 8),
> > +   SENSOR=5FATTR(freq9=5Flabel, S=5FIRUGO, show=5Focc=5Ffreq=5Flabel, =
NULL, 9),
> > +   SENSOR=5FATTR(freq10=5Flabel, S=5FIRUGO, show=5Focc=5Ffreq=5Flabel,=
 NULL, 10),
> > +
> > +};
> > +
> > +#define FREQ=5FUNIT=5FATTRS(X)                      \
> > +{   &freq=5Finput[X].dev=5Fattr.attr,           \
> > +   &freq=5Flabel[X].dev=5Fattr.attr,          \
> > +   NULL                                    \
> > +}
> > +
> > +/* 10-core CPU, occ has 22 freq sensors, more socket, more sensors */
> > +static struct attribute *occ=5Ffreq=5Fattr[][3] =3D {
> > +   FREQ=5FUNIT=5FATTRS(0),
> > +   FREQ=5FUNIT=5FATTRS(1),
> > +   FREQ=5FUNIT=5FATTRS(2),
> > +   FREQ=5FUNIT=5FATTRS(3),
> > +   FREQ=5FUNIT=5FATTRS(4),
> > +   FREQ=5FUNIT=5FATTRS(5),
> > +   FREQ=5FUNIT=5FATTRS(6),
> > +   FREQ=5FUNIT=5FATTRS(7),
> > +   FREQ=5FUNIT=5FATTRS(8),
> > +   FREQ=5FUNIT=5FATTRS(9),
> > +};
> > +
> > +static const struct attribute=5Fgroup occ=5Ffreq=5Fattr=5Fgroup[] =3D {
> > +   { .attrs =3D occ=5Ffreq=5Fattr[0] },
> > +   { .attrs =3D occ=5Ffreq=5Fattr[1] },
> > +   { .attrs =3D occ=5Ffreq=5Fattr[2] },
> > +   { .attrs =3D occ=5Ffreq=5Fattr[3] },
> > +   { .attrs =3D occ=5Ffreq=5Fattr[4] },
> > +   { .attrs =3D occ=5Ffreq=5Fattr[5] },
> > +   { .attrs =3D occ=5Ffreq=5Fattr[6] },
> > +   { .attrs =3D occ=5Ffreq=5Fattr[7] },
> > +   { .attrs =3D occ=5Ffreq=5Fattr[8] },
> > +   { .attrs =3D occ=5Ffreq=5Fattr[9] },
> > +};
> > +
> > +static struct sensor=5Fdevice=5Fattribute=5F2 caps=5Fcurr=5Fpowercap[]=
 =3D {
> > +   SENSOR=5FATTR=5F2(caps=5Fcurr=5Fpowercap, S=5FIRUGO, show=5Focc=5Fc=
aps, NULL, 0,
1),
> > +};
> > +static struct sensor=5Fdevice=5Fattribute=5F2 caps=5Fcurr=5Fpowerreadi=
ng[] =3D {
> > +   SENSOR=5FATTR=5F2(caps=5Fcurr=5Fpowerreading, S=5FIRUGO,
> > +      show=5Focc=5Fcaps, NULL, 1, 1),
> > +};
> > +static struct sensor=5Fdevice=5Fattribute=5F2 caps=5Fnorm=5Fpowercap[]=
 =3D {
> > +   SENSOR=5FATTR=5F2(caps=5Fnorm=5Fpowercap, S=5FIRUGO, show=5Focc=5Fc=
aps,
> > +      NULL, 2, 1),
> > +};
> > +static struct sensor=5Fdevice=5Fattribute=5F2 caps=5Fmax=5Fpowercap[] =
=3D {
> > +   SENSOR=5FATTR=5F2(caps=5Fmax=5Fpowercap, S=5FIRUGO, show=5Focc=5Fca=
ps, NULL, 3,
1),
> > +};
> > +static struct sensor=5Fdevice=5Fattribute=5F2 caps=5Fmin=5Fpowercap[] =
=3D {
> > +   SENSOR=5FATTR=5F2(caps=5Fmin=5Fpowercap, S=5FIRUGO, show=5Focc=5Fca=
ps, NULL, 4,
1),
> > +};
> > +static struct sensor=5Fdevice=5Fattribute=5F2 caps=5Fuser=5Fpowerlimit=
[] =3D {
> > +   SENSOR=5FATTR=5F2(caps=5Fuser=5Fpowerlimit, S=5FIRUGO, show=5Focc=
=5Fcaps, NULL,
5, 1),
> > +};
> > +#define CAPS=5FUNIT=5FATTRS(X)                      \
> > +{   &caps=5Fcurr=5Fpowercap[X].dev=5Fattr.attr,           \
> > +   &caps=5Fcurr=5Fpowerreading[X].dev=5Fattr.attr,           \
> > +   &caps=5Fnorm=5Fpowercap[X].dev=5Fattr.attr,           \
> > +   &caps=5Fmax=5Fpowercap[X].dev=5Fattr.attr,           \
> > +   &caps=5Fmin=5Fpowercap[X].dev=5Fattr.attr,           \
> > +   &caps=5Fuser=5Fpowerlimit[X].dev=5Fattr.attr,           \
> > +   NULL                                    \
> > +}
> > +
> > +/* 10-core CPU, occ has 1 caps sensors */
> > +static struct attribute *occ=5Fcaps=5Fattr[][7] =3D {
> > +   CAPS=5FUNIT=5FATTRS(0),
> > +};
> > +static const struct attribute=5Fgroup occ=5Fcaps=5Fattr=5Fgroup[] =3D {
> > +   { .attrs =3D occ=5Fcaps=5Fattr[0] },
> > +};
> > +
> > +static struct sensor=5Fdevice=5Fattribute power=5Finput[] =3D {
> > +   SENSOR=5FATTR(power1=5Finput, S=5FIRUGO, show=5Focc=5Fpower=5Finput=
, NULL, 1),
> > +   SENSOR=5FATTR(power2=5Finput, S=5FIRUGO, show=5Focc=5Fpower=5Finput=
, NULL, 2),
> > +   SENSOR=5FATTR(power3=5Finput, S=5FIRUGO, show=5Focc=5Fpower=5Finput=
, NULL, 3),
> > +   SENSOR=5FATTR(power4=5Finput, S=5FIRUGO, show=5Focc=5Fpower=5Finput=
, NULL, 4),
> > +   SENSOR=5FATTR(power5=5Finput, S=5FIRUGO, show=5Focc=5Fpower=5Finput=
, NULL, 5),
> > +   SENSOR=5FATTR(power6=5Finput, S=5FIRUGO, show=5Focc=5Fpower=5Finput=
, NULL, 6),
> > +   SENSOR=5FATTR(power7=5Finput, S=5FIRUGO, show=5Focc=5Fpower=5Finput=
, NULL, 7),
> > +   SENSOR=5FATTR(power8=5Finput, S=5FIRUGO, show=5Focc=5Fpower=5Finput=
, NULL, 8),
> > +   SENSOR=5FATTR(power9=5Finput, S=5FIRUGO, show=5Focc=5Fpower=5Finput=
, NULL, 9),
> > +   SENSOR=5FATTR(power10=5Finput, S=5FIRUGO, show=5Focc=5Fpower=5Finpu=
t, NULL,
10),
> > +   SENSOR=5FATTR(power11=5Finput, S=5FIRUGO, show=5Focc=5Fpower=5Finpu=
t, NULL,
11),
> > +};
> > +
> > +static struct sensor=5Fdevice=5Fattribute power=5Flabel[] =3D {
> > +   SENSOR=5FATTR(power1=5Flabel, S=5FIRUGO, show=5Focc=5Fpower=5Flabel=
, NULL, 1),
> > +   SENSOR=5FATTR(power2=5Flabel, S=5FIRUGO, show=5Focc=5Fpower=5Flabel=
, NULL, 2),
> > +   SENSOR=5FATTR(power3=5Flabel, S=5FIRUGO, show=5Focc=5Fpower=5Flabel=
, NULL, 3),
> > +   SENSOR=5FATTR(power4=5Flabel, S=5FIRUGO, show=5Focc=5Fpower=5Flabel=
, NULL, 4),
> > +   SENSOR=5FATTR(power5=5Flabel, S=5FIRUGO, show=5Focc=5Fpower=5Flabel=
, NULL, 5),
> > +   SENSOR=5FATTR(power6=5Flabel, S=5FIRUGO, show=5Focc=5Fpower=5Flabel=
, NULL, 6),
> > +   SENSOR=5FATTR(power7=5Flabel, S=5FIRUGO, show=5Focc=5Fpower=5Flabel=
, NULL, 7),
> > +   SENSOR=5FATTR(power8=5Flabel, S=5FIRUGO, show=5Focc=5Fpower=5Flabel=
, NULL, 8),
> > +   SENSOR=5FATTR(power9=5Flabel, S=5FIRUGO, show=5Focc=5Fpower=5Flabel=
, NULL, 9),
> > +   SENSOR=5FATTR(power10=5Flabel, S=5FIRUGO, show=5Focc=5Fpower=5Flabe=
l, NULL,
10),
> > +   SENSOR=5FATTR(power11=5Flabel, S=5FIRUGO, show=5Focc=5Fpower=5Flabe=
l, NULL,
11),
> > +};
> > +
> > +#define POWER=5FUNIT=5FATTRS(X)                      \
> > +{   &power=5Finput[X].dev=5Fattr.attr,           \
> > +   &power=5Flabel[X].dev=5Fattr.attr,          \
> > +   NULL                                    \
> > +}
> > +
> > +/* 10-core CPU, occ has 11 power sensors, more socket, more sensors */
> > +static struct attribute *occ=5Fpower=5Fattr[][3] =3D {
> > +   POWER=5FUNIT=5FATTRS(0),
> > +   POWER=5FUNIT=5FATTRS(1),
> > +   POWER=5FUNIT=5FATTRS(2),
> > +   POWER=5FUNIT=5FATTRS(3),
> > +   POWER=5FUNIT=5FATTRS(4),
> > +   POWER=5FUNIT=5FATTRS(5),
> > +   POWER=5FUNIT=5FATTRS(6),
> > +   POWER=5FUNIT=5FATTRS(7),
> > +   POWER=5FUNIT=5FATTRS(8),
> > +   POWER=5FUNIT=5FATTRS(9),
> > +   POWER=5FUNIT=5FATTRS(10),
> > +};
> > +
> > +static const struct attribute=5Fgroup occ=5Fpower=5Fattr=5Fgroup[] =3D=
 {
> > +   { .attrs =3D occ=5Fpower=5Fattr[0] },
> > +   { .attrs =3D occ=5Fpower=5Fattr[1] },
> > +   { .attrs =3D occ=5Fpower=5Fattr[2] },
> > +   { .attrs =3D occ=5Fpower=5Fattr[3] },
> > +   { .attrs =3D occ=5Fpower=5Fattr[4] },
> > +   { .attrs =3D occ=5Fpower=5Fattr[5] },
> > +   { .attrs =3D occ=5Fpower=5Fattr[6] },
> > +   { .attrs =3D occ=5Fpower=5Fattr[7] },
> > +   { .attrs =3D occ=5Fpower=5Fattr[8] },
> > +   { .attrs =3D occ=5Fpower=5Fattr[9] },
> > +   { .attrs =3D occ=5Fpower=5Fattr[10] },
> > +};
>
> There's a lot of stuff repeated 10 times here. Can we not generate this
> device info at runtime instead? Do we need flexibility for different
> numbers of sensors? Should we be encoding this in the device tree node?

I talked with Norm and Patrick, the driver need to take care of the case
when some cores
and some sensors are broken. So the hwmon attributes number is not fixed.
And the hwmon drivers in drivers/hwmon/ are full of similar sensor
attribute definition.
I cannot think of a easier way to reduce these.

>
> > +
> > +static void occ=5Fremove=5Fsysfs=5Ffiles(struct device *dev)
> > +{
> > +   int i =3D 0;
> > +
> > +   for (i =3D 0; i < ARRAY=5FSIZE(occ=5Ftemp=5Fattr=5Fgroup); i++)
> > +      sysfs=5Fremove=5Fgroup(&dev->kobj, &occ=5Ftemp=5Fattr=5Fgroup[i]=
);
> > +
> > +   for (i =3D 0; i < ARRAY=5FSIZE(occ=5Ffreq=5Fattr=5Fgroup); i++)
> > +      sysfs=5Fremove=5Fgroup(&dev->kobj, &occ=5Ffreq=5Fattr=5Fgroup[i]=
);
> > +
> > +   for (i =3D 0; i < ARRAY=5FSIZE(occ=5Fpower=5Fattr=5Fgroup); i++)
> > +      sysfs=5Fremove=5Fgroup(&dev->kobj, &occ=5Fpower=5Fattr=5Fgroup[i=
]);
> > +
> > +   for (i =3D 0; i < ARRAY=5FSIZE(occ=5Fcaps=5Fattr=5Fgroup); i++)
> > +      sysfs=5Fremove=5Fgroup(&dev->kobj, &occ=5Fcaps=5Fattr=5Fgroup[i]=
);
> > +}
> > +
> > +
> > +static int occ=5Fcreate=5Fsysfs=5Fattribute(struct device *dev)
> > +{
> > +   /* The sensor number varies for different
> > +    * platform depending on core number. We'd better
> > +    * create them dynamically
> > +    */
> > +   struct occ=5Fdrv=5Fdata *drv=5Fdata =3D dev=5Fget=5Fdrvdata(dev);
>
> You seem to be passing the struct device around a lot, and then doing
> dev=5Fget=5Fdrvdata. Just pass your own struct instead.
>

Most of the "struct device" are used for dev=5Fdbg(dev,..).. Maybe I should
remove those debug messages?

>
> > +/* used by old-style board info. */
> > +static const struct i2c=5Fdevice=5Fid occ=5Fids[] =3D {
> > +   { OCC=5FI2C=5FNAME, occ=5Fid, },
> > +   { /* LIST END */ }
> > +};
> > +MODULE=5FDEVICE=5FTABLE(i2c, occ=5Fids);
>
> We should just rely on the DT instead of this.
>

I did some test, when removing this "i2c=5Fdevice=5Fid" definition,
"echo occ-i2c 0x50 > /sys/class/i2c-adaptor/i2c-3/new=5Fdevice" would not
work.
We need this user space interface to instantiate i2c devices.


> Jeremy
> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--1__=8FBBF582DFC184278f9e8a93df938690918c8FBBF582DFC18427
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>Hi Jeremy,<br><br>Thanks many for your review and comments.<=
br><br>I made changes to the driver according to your comments, with bellow=
 exceptions: <br><br><tt>&quot;openbmc&quot; &lt;openbmc-bounces+shliyi=3Dc=
n.ibm.com@lists.ozlabs.org&gt; wrote on 11/27/2015 03:20:31 PM:<br><br>&gt;=
 From: Jeremy Kerr &lt;jk@ozlabs.org&gt;</tt><br><tt>&gt; To: openbmc@lists=
.ozlabs.org</tt><br><tt>&gt; Cc: adamliyi &lt;adamliyi@msn.com&gt;</tt><br>=
<tt>&gt; Date: 11/27/2015 03:20 PM</tt><br><tt>&gt; Subject: Re: [PATCH lin=
ux] Add BMC HWMON driver to kernel. Format <br>&gt; patch based on Joel's c=
omments.</tt><br><tt>&gt; Sent by: &quot;openbmc&quot; &lt;openbmc-bounces+=
shliyi=3Dcn.ibm.com@lists.ozlabs.org&gt;</tt><br><tt>&gt; <br>&gt; Hi Adam,=
<br>&gt; <br>&gt; Thanks for v2. Some further comments:<br>&gt;</tt><br><br=
><tt>&gt; <br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; (const char *)&amp;d[=
dnum], 4);<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;o-&gt;data.blocks[b].reserved=
0 =3D d[dnum+4];<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;o-&gt;data.blocks[b].se=
nsor=5Fformat =3D d[dnum+5];<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;o-&gt;data.=
blocks[b].sensor=5Flength =3D d[dnum+6];<br>&gt; &gt; + &nbsp; &nbsp; &nbsp=
;o-&gt;data.blocks[b].num=5Fof=5Fsensors =3D d[dnum+7];<br>&gt; &gt; + &nbs=
p; &nbsp; &nbsp;dnum =3D dnum + 8;<br>&gt; <br>&gt; More magic numbers. Can=
 we just use a struct assignment for things like<br>&gt; this?<br>&gt; <br>=
I agree these magic numbers are ugly. However, using struct assignemt would=
</tt><br><tt>need to take care of structure element alignment and endianess=
. In my new code, I used</tt><br><br><tt>&quot;</tt><table border=3D"0" cel=
lspacing=3D"0" cellpadding=3D"0"><tr valign=3D"top"><td width=3D"484" valig=
n=3D"middle"><font size=3D"4">+ memcpy(&amp;o-&gt;header, &amp;d[RESP=5FHEA=
DER=5FOFFSET], sizeof(o-&gt;header)); </font></td></tr>
<tr valign=3D"top"><td class=3D"^&#9786;" width=3D"484" valign=3D"middle"><=
img width=3D"1" height=3D"1" src=3D"cid:1=5F=5F=3D8FBBF582DFC184278f9e8a93d=
f938690918c8FB@" border=3D"0" alt=3D""></td></tr></table>
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr valign=3D"top">=
<td width=3D"225"><img width=3D"1" height=3D"1" src=3D"cid:1=5F=5F=3D8FBBF5=
82DFC184278f9e8a93df938690918c8FB@" border=3D"0" alt=3D""></td></tr>
<tr valign=3D"top"><td class=3D",$&#9632;" width=3D"225" valign=3D"middle">=
<font size=3D"4">+ o-&gt;header.error=5Flog=5Faddr=5Fstart =3D </font></td>=
</tr>
<tr valign=3D"top"><td class=3D"^&#9786;" width=3D"225" valign=3D"middle"><=
img width=3D"1" height=3D"1" src=3D"cid:1=5F=5F=3D8FBBF582DFC184278f9e8a93d=
f938690918c8FB@" border=3D"0" alt=3D""></td></tr></table>
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr valign=3D"top">=
<td width=3D"307"><img width=3D"1" height=3D"1" src=3D"cid:1=5F=5F=3D8FBBF5=
82DFC184278f9e8a93df938690918c8FB@" border=3D"0" alt=3D""></td></tr>
<tr valign=3D"top"><td class=3D",$&#9632;" width=3D"307" valign=3D"middle">=
<font size=3D"4">+ be32=5Fto=5Fcpu(o-&gt;header.error=5Flog=5Faddr=5Fstart)=
; </font></td></tr>
<tr valign=3D"top"><td class=3D"^&#9786;" width=3D"307" valign=3D"middle"><=
img width=3D"1" height=3D"1" src=3D"cid:1=5F=5F=3D8FBBF582DFC184278f9e8a93d=
f938690918c8FB@" border=3D"0" alt=3D""></td></tr></table>
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr valign=3D"top">=
<td width=3D"460" valign=3D"middle"><font size=3D"4">+ o-&gt;header.error=
=5Flog=5Flength =3D be16=5Fto=5Fcpu(o-&gt;header.error=5Flog=5Flength);</fo=
nt></td></tr></table><font size=3D"4">&quot;</font><br><tt>to replace a 45-=
byte data block parsing.</tt><br><tt>For this 8-byte data parsing, I'd pref=
er to parse them one-by-one, since it looks more easy to understand.</tt><b=
r><br><tt>&gt; <br>&gt; <br>&gt; &gt; +static struct sensor=5Fdevice=5Fattr=
ibute temp=5Finput[] =3D {<br>&gt; &gt; + &nbsp; SENSOR=5FATTR(temp1=5Finpu=
t, S=5FIRUGO, show=5Focc=5Ftemp=5Finput, NULL, 1),<br>&gt; &gt; + &nbsp; SE=
NSOR=5FATTR(temp2=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput, NULL, 2),<=
br>&gt; &gt; + &nbsp; SENSOR=5FATTR(temp3=5Finput, S=5FIRUGO, show=5Focc=5F=
temp=5Finput, NULL, 3),<br>&gt; &gt; + &nbsp; SENSOR=5FATTR(temp4=5Finput, =
S=5FIRUGO, show=5Focc=5Ftemp=5Finput, NULL, 4),<br>&gt; &gt; + &nbsp; SENSO=
R=5FATTR(temp5=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput, NULL, 5),<br>=
&gt; &gt; + &nbsp; SENSOR=5FATTR(temp6=5Finput, S=5FIRUGO, show=5Focc=5Ftem=
p=5Finput, NULL, 6),<br>&gt; &gt; + &nbsp; SENSOR=5FATTR(temp7=5Finput, S=
=5FIRUGO, show=5Focc=5Ftemp=5Finput, NULL, 7),<br>&gt; &gt; + &nbsp; SENSOR=
=5FATTR(temp8=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput, NULL, 8),<br>&=
gt; &gt; + &nbsp; SENSOR=5FATTR(temp9=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=
=5Finput, NULL, 9),<br>&gt; &gt; + &nbsp; SENSOR=5FATTR(temp10=5Finput, S=
=5FIRUGO, show=5Focc=5Ftemp=5Finput, NULL, 10),<br>&gt; &gt; + &nbsp; SENSO=
R=5FATTR(temp11=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput, NULL, 11),<b=
r>&gt; &gt; + &nbsp; SENSOR=5FATTR(temp12=5Finput, S=5FIRUGO, show=5Focc=5F=
temp=5Finput, NULL, 12),<br>&gt; &gt; + &nbsp; SENSOR=5FATTR(temp13=5Finput=
, S=5FIRUGO, show=5Focc=5Ftemp=5Finput, NULL, 13),<br>&gt; &gt; + &nbsp; SE=
NSOR=5FATTR(temp14=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput, NULL, 14)=
,<br>&gt; &gt; + &nbsp; SENSOR=5FATTR(temp15=5Finput, S=5FIRUGO, show=5Focc=
=5Ftemp=5Finput, NULL, 15),<br>&gt; &gt; + &nbsp; SENSOR=5FATTR(temp16=5Fin=
put, S=5FIRUGO, show=5Focc=5Ftemp=5Finput, NULL, 16),<br>&gt; &gt; + &nbsp;=
 SENSOR=5FATTR(temp17=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput, NULL, =
17),<br>&gt; &gt; + &nbsp; SENSOR=5FATTR(temp18=5Finput, S=5FIRUGO, show=5F=
occ=5Ftemp=5Finput, NULL, 18),<br>&gt; &gt; + &nbsp; SENSOR=5FATTR(temp19=
=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput, NULL, 19),<br>&gt; &gt; + &=
nbsp; SENSOR=5FATTR(temp20=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput, N=
ULL, 20),<br>&gt; &gt; + &nbsp; SENSOR=5FATTR(temp21=5Finput, S=5FIRUGO, sh=
ow=5Focc=5Ftemp=5Finput, NULL, 21),<br>&gt; &gt; + &nbsp; SENSOR=5FATTR(tem=
p22=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput, NULL, 22),<br>&gt; &gt; =
+};<br>&gt; &gt; +<br>&gt; &gt; +static struct sensor=5Fdevice=5Fattribute =
temp=5Flabel[] =3D {<br>&gt; &gt; + &nbsp; SENSOR=5FATTR(temp1=5Flabel, S=
=5FIRUGO, show=5Focc=5Ftemp=5Flabel, NULL, 1),<br>&gt; &gt; + &nbsp; SENSOR=
=5FATTR(temp2=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel, NULL, 2),<br>&=
gt; &gt; + &nbsp; SENSOR=5FATTR(temp3=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=
=5Flabel, NULL, 3),<br>&gt; &gt; + &nbsp; SENSOR=5FATTR(temp4=5Flabel, S=5F=
IRUGO, show=5Focc=5Ftemp=5Flabel, NULL, 4),<br>&gt; &gt; + &nbsp; SENSOR=5F=
ATTR(temp5=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel, NULL, 5),<br>&gt;=
 &gt; + &nbsp; SENSOR=5FATTR(temp6=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5F=
label, NULL, 6),<br>&gt; &gt; + &nbsp; SENSOR=5FATTR(temp7=5Flabel, S=5FIRU=
GO, show=5Focc=5Ftemp=5Flabel, NULL, 7),<br>&gt; &gt; + &nbsp; SENSOR=5FATT=
R(temp8=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel, NULL, 8),<br>&gt; &g=
t; + &nbsp; SENSOR=5FATTR(temp9=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flab=
el, NULL, 9),<br>&gt; &gt; + &nbsp; SENSOR=5FATTR(temp10=5Flabel, S=5FIRUGO=
, show=5Focc=5Ftemp=5Flabel, NULL, 10),<br>&gt; &gt; + &nbsp; SENSOR=5FATTR=
(temp11=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel, NULL, 11),<br>&gt; &=
gt; + &nbsp; SENSOR=5FATTR(temp12=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Fl=
abel, NULL, 12),<br>&gt; &gt; + &nbsp; SENSOR=5FATTR(temp13=5Flabel, S=5FIR=
UGO, show=5Focc=5Ftemp=5Flabel, NULL, 13),<br>&gt; &gt; + &nbsp; SENSOR=5FA=
TTR(temp14=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel, NULL, 14),<br>&gt=
; &gt; + &nbsp; SENSOR=5FATTR(temp15=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=
=5Flabel, NULL, 15),<br>&gt; &gt; + &nbsp; SENSOR=5FATTR(temp16=5Flabel, S=
=5FIRUGO, show=5Focc=5Ftemp=5Flabel, NULL, 16),<br>&gt; &gt; + &nbsp; SENSO=
R=5FATTR(temp17=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel, NULL, 17),<b=
r>&gt; &gt; + &nbsp; SENSOR=5FATTR(temp18=5Flabel, S=5FIRUGO, show=5Focc=5F=
temp=5Flabel, NULL, 18),<br>&gt; &gt; + &nbsp; SENSOR=5FATTR(temp19=5Flabel=
, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel, NULL, 19),<br>&gt; &gt; + &nbsp; SE=
NSOR=5FATTR(temp20=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel, NULL, 20)=
,<br>&gt; &gt; + &nbsp; SENSOR=5FATTR(temp21=5Flabel, S=5FIRUGO, show=5Focc=
=5Ftemp=5Flabel, NULL, 21),<br>&gt; &gt; + &nbsp; SENSOR=5FATTR(temp22=5Fla=
bel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel, NULL, 22),<br>&gt; &gt; +<br>&gt=
; &gt; +};<br>&gt; &gt; +<br>&gt; &gt; +#define TEMP=5FUNIT=5FATTRS(X) &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\<b=
r>&gt; &gt; +{ &nbsp; &amp;temp=5Finput[X].dev=5Fattr.attr, &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; \<br>&gt; &gt; + &nbsp; &amp;temp=5Flabel[X].dev=5Fattr=
.attr, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\<br>&gt; &gt; + &nbsp; NULL &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\<br>&gt; &gt; +}<br>&gt; &gt;=
 +<br>&gt; &gt; +/* 10-core CPU, occ has 22 temp sensors, more socket, more=
 sensors */<br>&gt; &gt; +static struct attribute *occ=5Ftemp=5Fattr[][3] =
=3D {<br>&gt; &gt; + &nbsp; TEMP=5FUNIT=5FATTRS(0),<br>&gt; &gt; + &nbsp; T=
EMP=5FUNIT=5FATTRS(1),<br>&gt; &gt; + &nbsp; TEMP=5FUNIT=5FATTRS(2),<br>&gt=
; &gt; + &nbsp; TEMP=5FUNIT=5FATTRS(3),<br>&gt; &gt; + &nbsp; TEMP=5FUNIT=
=5FATTRS(4),<br>&gt; &gt; + &nbsp; TEMP=5FUNIT=5FATTRS(5),<br>&gt; &gt; + &=
nbsp; TEMP=5FUNIT=5FATTRS(6),<br>&gt; &gt; + &nbsp; TEMP=5FUNIT=5FATTRS(7),=
<br>&gt; &gt; + &nbsp; TEMP=5FUNIT=5FATTRS(8),<br>&gt; &gt; + &nbsp; TEMP=
=5FUNIT=5FATTRS(9),<br>&gt; &gt; + &nbsp; TEMP=5FUNIT=5FATTRS(10),<br>&gt; =
&gt; + &nbsp; TEMP=5FUNIT=5FATTRS(11),<br>&gt; &gt; + &nbsp; TEMP=5FUNIT=5F=
ATTRS(12),<br>&gt; &gt; + &nbsp; TEMP=5FUNIT=5FATTRS(13),<br>&gt; &gt; + &n=
bsp; TEMP=5FUNIT=5FATTRS(14),<br>&gt; &gt; + &nbsp; TEMP=5FUNIT=5FATTRS(15)=
,<br>&gt; &gt; + &nbsp; TEMP=5FUNIT=5FATTRS(16),<br>&gt; &gt; + &nbsp; TEMP=
=5FUNIT=5FATTRS(17),<br>&gt; &gt; + &nbsp; TEMP=5FUNIT=5FATTRS(18),<br>&gt;=
 &gt; + &nbsp; TEMP=5FUNIT=5FATTRS(19),<br>&gt; &gt; + &nbsp; TEMP=5FUNIT=
=5FATTRS(20),<br>&gt; &gt; + &nbsp; TEMP=5FUNIT=5FATTRS(21),<br>&gt; &gt; +=
};<br>&gt; &gt; +<br>&gt; &gt; +static const struct attribute=5Fgroup occ=
=5Ftemp=5Fattr=5Fgroup[] =3D {<br>&gt; &gt; + &nbsp; { .attrs =3D occ=5Ftem=
p=5Fattr[0] },<br>&gt; &gt; + &nbsp; { .attrs =3D occ=5Ftemp=5Fattr[1] },<b=
r>&gt; &gt; + &nbsp; { .attrs =3D occ=5Ftemp=5Fattr[2] },<br>&gt; &gt; + &n=
bsp; { .attrs =3D occ=5Ftemp=5Fattr[3] },<br>&gt; &gt; + &nbsp; { .attrs =
=3D occ=5Ftemp=5Fattr[4] },<br>&gt; &gt; + &nbsp; { .attrs =3D occ=5Ftemp=
=5Fattr[5] },<br>&gt; &gt; + &nbsp; { .attrs =3D occ=5Ftemp=5Fattr[6] },<br=
>&gt; &gt; + &nbsp; { .attrs =3D occ=5Ftemp=5Fattr[7] },<br>&gt; &gt; + &nb=
sp; { .attrs =3D occ=5Ftemp=5Fattr[8] },<br>&gt; &gt; + &nbsp; { .attrs =3D=
 occ=5Ftemp=5Fattr[9] },<br>&gt; &gt; + &nbsp; { .attrs =3D occ=5Ftemp=5Fat=
tr[10] },<br>&gt; &gt; + &nbsp; { .attrs =3D occ=5Ftemp=5Fattr[11] },<br>&g=
t; &gt; + &nbsp; { .attrs =3D occ=5Ftemp=5Fattr[12] },<br>&gt; &gt; + &nbsp=
; { .attrs =3D occ=5Ftemp=5Fattr[13] },<br>&gt; &gt; + &nbsp; { .attrs =3D =
occ=5Ftemp=5Fattr[14] },<br>&gt; &gt; + &nbsp; { .attrs =3D occ=5Ftemp=5Fat=
tr[15] },<br>&gt; &gt; + &nbsp; { .attrs =3D occ=5Ftemp=5Fattr[16] },<br>&g=
t; &gt; + &nbsp; { .attrs =3D occ=5Ftemp=5Fattr[17] },<br>&gt; &gt; + &nbsp=
; { .attrs =3D occ=5Ftemp=5Fattr[18] },<br>&gt; &gt; + &nbsp; { .attrs =3D =
occ=5Ftemp=5Fattr[19] },<br>&gt; &gt; + &nbsp; { .attrs =3D occ=5Ftemp=5Fat=
tr[20] },<br>&gt; &gt; + &nbsp; { .attrs =3D occ=5Ftemp=5Fattr[21] },<br>&g=
t; &gt; +};<br>&gt; &gt; +<br>&gt; &gt; +<br>&gt; &gt; +static struct senso=
r=5Fdevice=5Fattribute freq=5Finput[] =3D {<br>&gt; &gt; + &nbsp; SENSOR=5F=
ATTR(freq1=5Finput, S=5FIRUGO, show=5Focc=5Ffreq=5Finput, NULL, 1),<br>&gt;=
 &gt; + &nbsp; SENSOR=5FATTR(freq2=5Finput, S=5FIRUGO, show=5Focc=5Ffreq=5F=
input, NULL, 2),<br>&gt; &gt; + &nbsp; SENSOR=5FATTR(freq3=5Finput, S=5FIRU=
GO, show=5Focc=5Ffreq=5Finput, NULL, 3),<br>&gt; &gt; + &nbsp; SENSOR=5FATT=
R(freq4=5Finput, S=5FIRUGO, show=5Focc=5Ffreq=5Finput, NULL, 4),<br>&gt; &g=
t; + &nbsp; SENSOR=5FATTR(freq5=5Finput, S=5FIRUGO, show=5Focc=5Ffreq=5Finp=
ut, NULL, 5),<br>&gt; &gt; + &nbsp; SENSOR=5FATTR(freq6=5Finput, S=5FIRUGO,=
 show=5Focc=5Ffreq=5Finput, NULL, 6),<br>&gt; &gt; + &nbsp; SENSOR=5FATTR(f=
req7=5Finput, S=5FIRUGO, show=5Focc=5Ffreq=5Finput, NULL, 7),<br>&gt; &gt; =
+ &nbsp; SENSOR=5FATTR(freq8=5Finput, S=5FIRUGO, show=5Focc=5Ffreq=5Finput,=
 NULL, 8),<br>&gt; &gt; + &nbsp; SENSOR=5FATTR(freq9=5Finput, S=5FIRUGO, sh=
ow=5Focc=5Ffreq=5Finput, NULL, 9),<br>&gt; &gt; + &nbsp; SENSOR=5FATTR(freq=
10=5Finput, S=5FIRUGO, show=5Focc=5Ffreq=5Finput, NULL, 10),<br>&gt; &gt; +=
};<br>&gt; &gt; +<br>&gt; &gt; +static struct sensor=5Fdevice=5Fattribute f=
req=5Flabel[] =3D {<br>&gt; &gt; + &nbsp; SENSOR=5FATTR(freq1=5Flabel, S=5F=
IRUGO, show=5Focc=5Ffreq=5Flabel, NULL, 1),<br>&gt; &gt; + &nbsp; SENSOR=5F=
ATTR(freq2=5Flabel, S=5FIRUGO, show=5Focc=5Ffreq=5Flabel, NULL, 2),<br>&gt;=
 &gt; + &nbsp; SENSOR=5FATTR(freq3=5Flabel, S=5FIRUGO, show=5Focc=5Ffreq=5F=
label, NULL, 3),<br>&gt; &gt; + &nbsp; SENSOR=5FATTR(freq4=5Flabel, S=5FIRU=
GO, show=5Focc=5Ffreq=5Flabel, NULL, 4),<br>&gt; &gt; + &nbsp; SENSOR=5FATT=
R(freq5=5Flabel, S=5FIRUGO, show=5Focc=5Ffreq=5Flabel, NULL, 5),<br>&gt; &g=
t; + &nbsp; SENSOR=5FATTR(freq6=5Flabel, S=5FIRUGO, show=5Focc=5Ffreq=5Flab=
el, NULL, 6),<br>&gt; &gt; + &nbsp; SENSOR=5FATTR(freq7=5Flabel, S=5FIRUGO,=
 show=5Focc=5Ffreq=5Flabel, NULL, 7),<br>&gt; &gt; + &nbsp; SENSOR=5FATTR(f=
req8=5Flabel, S=5FIRUGO, show=5Focc=5Ffreq=5Flabel, NULL, 8),<br>&gt; &gt; =
+ &nbsp; SENSOR=5FATTR(freq9=5Flabel, S=5FIRUGO, show=5Focc=5Ffreq=5Flabel,=
 NULL, 9),<br>&gt; &gt; + &nbsp; SENSOR=5FATTR(freq10=5Flabel, S=5FIRUGO, s=
how=5Focc=5Ffreq=5Flabel, NULL, 10),<br>&gt; &gt; +<br>&gt; &gt; +};<br>&gt=
; &gt; +<br>&gt; &gt; +#define FREQ=5FUNIT=5FATTRS(X) &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\<br>&gt; &gt; +{ &n=
bsp; &amp;freq=5Finput[X].dev=5Fattr.attr, &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; \<br>&gt; &gt; + &nbsp; &amp;freq=5Flabel[X].dev=5Fattr.attr, &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;\<br>&gt; &gt; + &nbsp; NULL &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;\<br>&gt; &gt; +}<br>&gt; &gt; +<br>&gt; &gt; +=
/* 10-core CPU, occ has 22 freq sensors, more socket, more sensors */<br>&g=
t; &gt; +static struct attribute *occ=5Ffreq=5Fattr[][3] =3D {<br>&gt; &gt;=
 + &nbsp; FREQ=5FUNIT=5FATTRS(0),<br>&gt; &gt; + &nbsp; FREQ=5FUNIT=5FATTRS=
(1),<br>&gt; &gt; + &nbsp; FREQ=5FUNIT=5FATTRS(2),<br>&gt; &gt; + &nbsp; FR=
EQ=5FUNIT=5FATTRS(3),<br>&gt; &gt; + &nbsp; FREQ=5FUNIT=5FATTRS(4),<br>&gt;=
 &gt; + &nbsp; FREQ=5FUNIT=5FATTRS(5),<br>&gt; &gt; + &nbsp; FREQ=5FUNIT=5F=
ATTRS(6),<br>&gt; &gt; + &nbsp; FREQ=5FUNIT=5FATTRS(7),<br>&gt; &gt; + &nbs=
p; FREQ=5FUNIT=5FATTRS(8),<br>&gt; &gt; + &nbsp; FREQ=5FUNIT=5FATTRS(9),<br=
>&gt; &gt; +};<br>&gt; &gt; +<br>&gt; &gt; +static const struct attribute=
=5Fgroup occ=5Ffreq=5Fattr=5Fgroup[] =3D {<br>&gt; &gt; + &nbsp; { .attrs =
=3D occ=5Ffreq=5Fattr[0] },<br>&gt; &gt; + &nbsp; { .attrs =3D occ=5Ffreq=
=5Fattr[1] },<br>&gt; &gt; + &nbsp; { .attrs =3D occ=5Ffreq=5Fattr[2] },<br=
>&gt; &gt; + &nbsp; { .attrs =3D occ=5Ffreq=5Fattr[3] },<br>&gt; &gt; + &nb=
sp; { .attrs =3D occ=5Ffreq=5Fattr[4] },<br>&gt; &gt; + &nbsp; { .attrs =3D=
 occ=5Ffreq=5Fattr[5] },<br>&gt; &gt; + &nbsp; { .attrs =3D occ=5Ffreq=5Fat=
tr[6] },<br>&gt; &gt; + &nbsp; { .attrs =3D occ=5Ffreq=5Fattr[7] },<br>&gt;=
 &gt; + &nbsp; { .attrs =3D occ=5Ffreq=5Fattr[8] },<br>&gt; &gt; + &nbsp; {=
 .attrs =3D occ=5Ffreq=5Fattr[9] },<br>&gt; &gt; +};<br>&gt; &gt; +<br>&gt;=
 &gt; +static struct sensor=5Fdevice=5Fattribute=5F2 caps=5Fcurr=5Fpowercap=
[] =3D {<br>&gt; &gt; + &nbsp; SENSOR=5FATTR=5F2(caps=5Fcurr=5Fpowercap, S=
=5FIRUGO, show=5Focc=5Fcaps, NULL, 0, 1),<br>&gt; &gt; +};<br>&gt; &gt; +st=
atic struct sensor=5Fdevice=5Fattribute=5F2 caps=5Fcurr=5Fpowerreading[] =
=3D {<br>&gt; &gt; + &nbsp; SENSOR=5FATTR=5F2(caps=5Fcurr=5Fpowerreading, S=
=5FIRUGO,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;show=5Focc=5Fcaps, NULL, 1, 1)=
,<br>&gt; &gt; +};<br>&gt; &gt; +static struct sensor=5Fdevice=5Fattribute=
=5F2 caps=5Fnorm=5Fpowercap[] =3D {<br>&gt; &gt; + &nbsp; SENSOR=5FATTR=5F2=
(caps=5Fnorm=5Fpowercap, S=5FIRUGO, show=5Focc=5Fcaps,<br>&gt; &gt; + &nbsp=
; &nbsp; &nbsp;NULL, 2, 1),<br>&gt; &gt; +};<br>&gt; &gt; +static struct se=
nsor=5Fdevice=5Fattribute=5F2 caps=5Fmax=5Fpowercap[] =3D {<br>&gt; &gt; + =
&nbsp; SENSOR=5FATTR=5F2(caps=5Fmax=5Fpowercap, S=5FIRUGO, show=5Focc=5Fcap=
s, NULL, 3, 1),<br>&gt; &gt; +};<br>&gt; &gt; +static struct sensor=5Fdevic=
e=5Fattribute=5F2 caps=5Fmin=5Fpowercap[] =3D {<br>&gt; &gt; + &nbsp; SENSO=
R=5FATTR=5F2(caps=5Fmin=5Fpowercap, S=5FIRUGO, show=5Focc=5Fcaps, NULL, 4, =
1),<br>&gt; &gt; +};<br>&gt; &gt; +static struct sensor=5Fdevice=5Fattribut=
e=5F2 caps=5Fuser=5Fpowerlimit[] =3D {<br>&gt; &gt; + &nbsp; SENSOR=5FATTR=
=5F2(caps=5Fuser=5Fpowerlimit, S=5FIRUGO, show=5Focc=5Fcaps, NULL, 5, 1),<b=
r>&gt; &gt; +};<br>&gt; &gt; +#define CAPS=5FUNIT=5FATTRS(X) &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\<br>&gt; &gt=
; +{ &nbsp; &amp;caps=5Fcurr=5Fpowercap[X].dev=5Fattr.attr, &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; \<br>&gt; &gt; + &nbsp; &amp;caps=5Fcurr=5Fpowerreading=
[X].dev=5Fattr.attr, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \<br>&gt; &gt; + &n=
bsp; &amp;caps=5Fnorm=5Fpowercap[X].dev=5Fattr.attr, &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; \<br>&gt; &gt; + &nbsp; &amp;caps=5Fmax=5Fpowercap[X].dev=5Fat=
tr.attr, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \<br>&gt; &gt; + &nbsp; &amp;ca=
ps=5Fmin=5Fpowercap[X].dev=5Fattr.attr, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
\<br>&gt; &gt; + &nbsp; &amp;caps=5Fuser=5Fpowerlimit[X].dev=5Fattr.attr, &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \<br>&gt; &gt; + &nbsp; NULL &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\<br>&gt; &gt; +}<br>&gt; &gt; +<br>&=
gt; &gt; +/* 10-core CPU, occ has 1 caps sensors */<br>&gt; &gt; +static st=
ruct attribute *occ=5Fcaps=5Fattr[][7] =3D {<br>&gt; &gt; + &nbsp; CAPS=5FU=
NIT=5FATTRS(0),<br>&gt; &gt; +};<br>&gt; &gt; +static const struct attribut=
e=5Fgroup occ=5Fcaps=5Fattr=5Fgroup[] =3D {<br>&gt; &gt; + &nbsp; { .attrs =
=3D occ=5Fcaps=5Fattr[0] },<br>&gt; &gt; +};<br>&gt; &gt; +<br>&gt; &gt; +s=
tatic struct sensor=5Fdevice=5Fattribute power=5Finput[] =3D {<br>&gt; &gt;=
 + &nbsp; SENSOR=5FATTR(power1=5Finput, S=5FIRUGO, show=5Focc=5Fpower=5Finp=
ut, NULL, 1),<br>&gt; &gt; + &nbsp; SENSOR=5FATTR(power2=5Finput, S=5FIRUGO=
, show=5Focc=5Fpower=5Finput, NULL, 2),<br>&gt; &gt; + &nbsp; SENSOR=5FATTR=
(power3=5Finput, S=5FIRUGO, show=5Focc=5Fpower=5Finput, NULL, 3),<br>&gt; &=
gt; + &nbsp; SENSOR=5FATTR(power4=5Finput, S=5FIRUGO, show=5Focc=5Fpower=5F=
input, NULL, 4),<br>&gt; &gt; + &nbsp; SENSOR=5FATTR(power5=5Finput, S=5FIR=
UGO, show=5Focc=5Fpower=5Finput, NULL, 5),<br>&gt; &gt; + &nbsp; SENSOR=5FA=
TTR(power6=5Finput, S=5FIRUGO, show=5Focc=5Fpower=5Finput, NULL, 6),<br>&gt=
; &gt; + &nbsp; SENSOR=5FATTR(power7=5Finput, S=5FIRUGO, show=5Focc=5Fpower=
=5Finput, NULL, 7),<br>&gt; &gt; + &nbsp; SENSOR=5FATTR(power8=5Finput, S=
=5FIRUGO, show=5Focc=5Fpower=5Finput, NULL, 8),<br>&gt; &gt; + &nbsp; SENSO=
R=5FATTR(power9=5Finput, S=5FIRUGO, show=5Focc=5Fpower=5Finput, NULL, 9),<b=
r>&gt; &gt; + &nbsp; SENSOR=5FATTR(power10=5Finput, S=5FIRUGO, show=5Focc=
=5Fpower=5Finput, NULL, 10),<br>&gt; &gt; + &nbsp; SENSOR=5FATTR(power11=5F=
input, S=5FIRUGO, show=5Focc=5Fpower=5Finput, NULL, 11),<br>&gt; &gt; +};<b=
r>&gt; &gt; +<br>&gt; &gt; +static struct sensor=5Fdevice=5Fattribute power=
=5Flabel[] =3D {<br>&gt; &gt; + &nbsp; SENSOR=5FATTR(power1=5Flabel, S=5FIR=
UGO, show=5Focc=5Fpower=5Flabel, NULL, 1),<br>&gt; &gt; + &nbsp; SENSOR=5FA=
TTR(power2=5Flabel, S=5FIRUGO, show=5Focc=5Fpower=5Flabel, NULL, 2),<br>&gt=
; &gt; + &nbsp; SENSOR=5FATTR(power3=5Flabel, S=5FIRUGO, show=5Focc=5Fpower=
=5Flabel, NULL, 3),<br>&gt; &gt; + &nbsp; SENSOR=5FATTR(power4=5Flabel, S=
=5FIRUGO, show=5Focc=5Fpower=5Flabel, NULL, 4),<br>&gt; &gt; + &nbsp; SENSO=
R=5FATTR(power5=5Flabel, S=5FIRUGO, show=5Focc=5Fpower=5Flabel, NULL, 5),<b=
r>&gt; &gt; + &nbsp; SENSOR=5FATTR(power6=5Flabel, S=5FIRUGO, show=5Focc=5F=
power=5Flabel, NULL, 6),<br>&gt; &gt; + &nbsp; SENSOR=5FATTR(power7=5Flabel=
, S=5FIRUGO, show=5Focc=5Fpower=5Flabel, NULL, 7),<br>&gt; &gt; + &nbsp; SE=
NSOR=5FATTR(power8=5Flabel, S=5FIRUGO, show=5Focc=5Fpower=5Flabel, NULL, 8)=
,<br>&gt; &gt; + &nbsp; SENSOR=5FATTR(power9=5Flabel, S=5FIRUGO, show=5Focc=
=5Fpower=5Flabel, NULL, 9),<br>&gt; &gt; + &nbsp; SENSOR=5FATTR(power10=5Fl=
abel, S=5FIRUGO, show=5Focc=5Fpower=5Flabel, NULL, 10),<br>&gt; &gt; + &nbs=
p; SENSOR=5FATTR(power11=5Flabel, S=5FIRUGO, show=5Focc=5Fpower=5Flabel, NU=
LL, 11),<br>&gt; &gt; +};<br>&gt; &gt; +<br>&gt; &gt; +#define POWER=5FUNIT=
=5FATTRS(X) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;\<br>&gt; &gt; +{ &nbsp; &amp;power=5Finput[X].dev=5Fattr.attr=
, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \<br>&gt; &gt; + &nbsp; &amp;power=5Fl=
abel[X].dev=5Fattr.attr, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\<br>&gt; &gt; +=
 &nbsp; NULL &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\<br>&gt; &g=
t; +}<br>&gt; &gt; +<br>&gt; &gt; +/* 10-core CPU, occ has 11 power sensors=
, more socket, more sensors */<br>&gt; &gt; +static struct attribute *occ=
=5Fpower=5Fattr[][3] =3D {<br>&gt; &gt; + &nbsp; POWER=5FUNIT=5FATTRS(0),<b=
r>&gt; &gt; + &nbsp; POWER=5FUNIT=5FATTRS(1),<br>&gt; &gt; + &nbsp; POWER=
=5FUNIT=5FATTRS(2),<br>&gt; &gt; + &nbsp; POWER=5FUNIT=5FATTRS(3),<br>&gt; =
&gt; + &nbsp; POWER=5FUNIT=5FATTRS(4),<br>&gt; &gt; + &nbsp; POWER=5FUNIT=
=5FATTRS(5),<br>&gt; &gt; + &nbsp; POWER=5FUNIT=5FATTRS(6),<br>&gt; &gt; + =
&nbsp; POWER=5FUNIT=5FATTRS(7),<br>&gt; &gt; + &nbsp; POWER=5FUNIT=5FATTRS(=
8),<br>&gt; &gt; + &nbsp; POWER=5FUNIT=5FATTRS(9),<br>&gt; &gt; + &nbsp; PO=
WER=5FUNIT=5FATTRS(10),<br>&gt; &gt; +};<br>&gt; &gt; +<br>&gt; &gt; +stati=
c const struct attribute=5Fgroup occ=5Fpower=5Fattr=5Fgroup[] =3D {<br>&gt;=
 &gt; + &nbsp; { .attrs =3D occ=5Fpower=5Fattr[0] },<br>&gt; &gt; + &nbsp; =
{ .attrs =3D occ=5Fpower=5Fattr[1] },<br>&gt; &gt; + &nbsp; { .attrs =3D oc=
c=5Fpower=5Fattr[2] },<br>&gt; &gt; + &nbsp; { .attrs =3D occ=5Fpower=5Fatt=
r[3] },<br>&gt; &gt; + &nbsp; { .attrs =3D occ=5Fpower=5Fattr[4] },<br>&gt;=
 &gt; + &nbsp; { .attrs =3D occ=5Fpower=5Fattr[5] },<br>&gt; &gt; + &nbsp; =
{ .attrs =3D occ=5Fpower=5Fattr[6] },<br>&gt; &gt; + &nbsp; { .attrs =3D oc=
c=5Fpower=5Fattr[7] },<br>&gt; &gt; + &nbsp; { .attrs =3D occ=5Fpower=5Fatt=
r[8] },<br>&gt; &gt; + &nbsp; { .attrs =3D occ=5Fpower=5Fattr[9] },<br>&gt;=
 &gt; + &nbsp; { .attrs =3D occ=5Fpower=5Fattr[10] },<br>&gt; &gt; +};<br>&=
gt; <br>&gt; There's a lot of stuff repeated 10 times here. Can we not gene=
rate this<br>&gt; device info at runtime instead? Do we need flexibility fo=
r different<br>&gt; numbers of sensors? Should we be encoding this in the d=
evice tree node?<br></tt><br><tt>I talked with Norm and Patrick, the driver=
 need to take care of the case when some cores</tt><br><tt>and some sensors=
 are broken. So the hwmon attributes number is not fixed.</tt><br><tt>And t=
he hwmon drivers in drivers/hwmon/ are full of similar sensor attribute def=
inition.</tt><br><tt>I cannot think of a easier way to reduce these.</tt><b=
r><br><tt>&gt; <br>&gt; &gt; +<br>&gt; &gt; +static void occ=5Fremove=5Fsys=
fs=5Ffiles(struct device *dev)<br>&gt; &gt; +{<br>&gt; &gt; + &nbsp; int i =
=3D 0;<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; for (i =3D 0; i &lt; ARRAY=5FSI=
ZE(occ=5Ftemp=5Fattr=5Fgroup); i++)<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;sysf=
s=5Fremove=5Fgroup(&amp;dev-&gt;kobj, &amp;occ=5Ftemp=5Fattr=5Fgroup[i]);<b=
r>&gt; &gt; +<br>&gt; &gt; + &nbsp; for (i =3D 0; i &lt; ARRAY=5FSIZE(occ=
=5Ffreq=5Fattr=5Fgroup); i++)<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;sysfs=5Fre=
move=5Fgroup(&amp;dev-&gt;kobj, &amp;occ=5Ffreq=5Fattr=5Fgroup[i]);<br>&gt;=
 &gt; +<br>&gt; &gt; + &nbsp; for (i =3D 0; i &lt; ARRAY=5FSIZE(occ=5Fpower=
=5Fattr=5Fgroup); i++)<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;sysfs=5Fremove=5F=
group(&amp;dev-&gt;kobj, &amp;occ=5Fpower=5Fattr=5Fgroup[i]);<br>&gt; &gt; =
+<br>&gt; &gt; + &nbsp; for (i =3D 0; i &lt; ARRAY=5FSIZE(occ=5Fcaps=5Fattr=
=5Fgroup); i++)<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;sysfs=5Fremove=5Fgroup(&=
amp;dev-&gt;kobj, &amp;occ=5Fcaps=5Fattr=5Fgroup[i]);<br>&gt; &gt; +}<br>&g=
t; &gt; +<br>&gt; &gt; +<br>&gt; &gt; +static int occ=5Fcreate=5Fsysfs=5Fat=
tribute(struct device *dev)<br>&gt; &gt; +{<br>&gt; &gt; + &nbsp; /* The se=
nsor number varies for different<br>&gt; &gt; + &nbsp; &nbsp;* platform dep=
ending on core number. We'd better<br>&gt; &gt; + &nbsp; &nbsp;* create the=
m dynamically<br>&gt; &gt; + &nbsp; &nbsp;*/<br>&gt; &gt; + &nbsp; struct o=
cc=5Fdrv=5Fdata *drv=5Fdata =3D dev=5Fget=5Fdrvdata(dev);<br>&gt; <br>&gt; =
You seem to be passing the struct device around a lot, and then doing<br>&g=
t; dev=5Fget=5Fdrvdata. Just pass your own struct instead.<br>&gt; <br></tt=
><br><tt>Most of the &quot;struct device&quot; are used for dev=5Fdbg(dev,.=
.).. Maybe I should remove those debug messages?</tt><br><br><tt>&gt; <br>&=
gt; &gt; +/* used by old-style board info. */<br>&gt; &gt; +static const st=
ruct i2c=5Fdevice=5Fid occ=5Fids[] =3D {<br>&gt; &gt; + &nbsp; { OCC=5FI2C=
=5FNAME, occ=5Fid, },<br>&gt; &gt; + &nbsp; { /* LIST END */ }<br>&gt; &gt;=
 +};<br>&gt; &gt; +MODULE=5FDEVICE=5FTABLE(i2c, occ=5Fids);<br>&gt; <br>&gt=
; We should just rely on the DT instead of this.<br>&gt; <br></tt><br><tt>I=
 did some test, when removing this &quot;i2c=5Fdevice=5Fid&quot; definition=
,</tt><br><tt>&quot;echo occ-i2c 0x50 &gt; /sys/class/i2c-adaptor/i2c-3/new=
=5Fdevice&quot; would not work.</tt><br><tt>We need this user space interfa=
ce to instantiate i2c devices.</tt><br><br><tt><br>&gt; Jeremy<br>&gt; =5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>&gt; ope=
nbmc mailing list<br>&gt; openbmc@lists.ozlabs.org<br>&gt; </tt><tt><a href=
=3D"https://lists.ozlabs.org/listinfo/openbmc">https://lists.ozlabs.org/lis=
tinfo/openbmc</a></tt><tt><br></tt><BR>
</body></html>

--1__=8FBBF582DFC184278f9e8a93df938690918c8FBBF582DFC18427--


--0__=8FBBF582DFC184278f9e8a93df938690918c8FBBF582DFC18427
Content-type: image/gif; 
	name="ecblank.gif"
Content-Disposition: inline; filename="ecblank.gif"
Content-ID: <1__=8FBBF582DFC184278f9e8a93df938690918c8FB@>
Content-Transfer-Encoding: base64

R0lGODlhEAABAIAAAAAAAP///yH5BAEAAAEALAAAAAAQAAEAAAIEjI8ZBQA7


--0__=8FBBF582DFC184278f9e8a93df938690918c8FBBF582DFC18427--
