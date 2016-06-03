Return-Path: <bjlinan@cn.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rLVKP6C6JzDqkm
 for <openbmc@lists.ozlabs.org>; Fri,  3 Jun 2016 13:42:33 +1000 (AEST)
Received: from pps.filterd (m0075771.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u533eoEc030022
 for <openbmc@lists.ozlabs.org>; Thu, 2 Jun 2016 23:42:31 -0400
Received: from e23smtp05.au.ibm.com (e23smtp05.au.ibm.com [202.81.31.147])
 by mx0a-001b2d01.pphosted.com with ESMTP id 23ak02tvjm-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 02 Jun 2016 23:42:31 -0400
Received: from localhost
 by e23smtp05.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <bjlinan@cn.ibm.com>;
 Fri, 3 Jun 2016 13:42:28 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp05.au.ibm.com (202.81.31.211) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 3 Jun 2016 13:42:26 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: bjlinan@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay08.au.ibm.com (d23relay08.au.ibm.com [9.185.71.33])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id 0ADE72BB0077
 for <openbmc@lists.ozlabs.org>; Fri,  3 Jun 2016 13:42:09 +1000 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u533fwNH22347806
 for <openbmc@lists.ozlabs.org>; Fri, 3 Jun 2016 13:41:58 +1000
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u533fwMa015922
 for <openbmc@lists.ozlabs.org>; Fri, 3 Jun 2016 13:41:58 +1000
Received: from d50lp31.co.us.ibm.com (d50lp31.boulder.ibm.com [9.17.249.32])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u533fuHv015876
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Fri, 3 Jun 2016 13:41:57 +1000
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <bjlinan@cn.ibm.com>;
 Thu, 2 Jun 2016 21:41:56 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.93)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Thu, 2 Jun 2016 21:41:54 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: bjlinan@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <bjlinan@cn.ibm.com>;
 Fri, 3 Jun 2016 03:41:53 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.39) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 3 Jun 2016 03:41:50 -0000
Received: from us1a3-mail166.a3.dal06.isc4sb.com ([10.146.71.123])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2016060303414938-26547 ;
 Fri, 3 Jun 2016 03:41:49 +0000 
In-Reply-To: <574BD883.7030004@ozlabs.org>
To: Jeremy Kerr <jk@ozlabs.org>
Cc: openbmc@lists.ozlabs.org, OpenBMC Patches <openbmc-patches@stwcx.xyz>
Subject: Re: [PATCH openpower-host-ipmi-oem v3] Fix issue5 for endian safe
From: "Nan KX Li" <bjlinan@cn.ibm.com>
Date: Fri, 3 Jun 2016 11:41:49 +0800
References: <20160527120039.11133-1-openbmc-patches@stwcx.xyz>
 <20160527120039.11133-2-openbmc-patches@stwcx.xyz>
 <574BD883.7030004@ozlabs.org>
MIME-Version: 1.0
X-KeepSent: C9467969:D48D474C-48257FC7:000E6160;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP2 SHF37 August 25, 2014
X-LLNOutbound: False
X-Disclaimed: 32527
X-TNEFEvaluated: 1
Content-Type: multipart/alternative;
 boundary="=_alternative 0013708048257FC7_="
x-cbid: 16060303-0016-0000-0000-000001A16B0D
X-IBM-ISS-SpamDetectors: Score=0.445263; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.445263; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005333; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000168; SDB=6.00711171; UDB=6.00330626; UTC=2016-06-03
 03:41:51
x-cbparentid: 16060303-3202-0000-0000-000000956238
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OFC9467969.D48D474C-ON48257FC7.000E6160-48257FC7.00145079@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-06-03_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1606030040
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
X-List-Received-Date: Fri, 03 Jun 2016 03:42:34 -0000


--=_alternative 0013708048257FC7_=
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="GB2312"

SGkgSmVyZW15LA0KDQpJJ3ZlIHVwZGF0ZWQgbXkgcHVsbCByZXF1ZXN0IDogDQpodHRwczovL2dp
dGh1Yi5jb20vb3BlbmJtYy9vcGVucG93ZXItaG9zdC1pcG1pLW9lbS9wdWxsLzEzLg0KUGxlYXNl
IHJldmlldyBpdC4NCg0KRm9yIHRoZSBhbGlnbm1lbnQgcmVxdWlyZW1lbnQsIEknZCB1c2UgdW5z
aWduZWQgY2hhciB0eXBlIHRvIGFjY2VzcyB0aGUgDQpyZXF1ZXN0b3IncyBidWZmZXIuIFNvOg0K
DQp1aW50OF90ICpyZXFwdHIgPSAodWludDhfdCAqKSByZXF1ZXN0OyANCg0KZXNlbF9yZXEucmVz
aWQgICAgID0gbGUxNnRvaCgoKCh1aW50MTZfdCkgcmVxcHRyWzFdKSA8PCA4KSArIHJlcXB0clsw
XSk7IA0KZXNlbF9yZXEuc2VscmVjb3JkID0gbGUxNnRvaCgoKCh1aW50MTZfdCkgcmVxcHRyWzNd
KSA8PCA4KSArIHJlcXB0clsyXSk7IA0KZXNlbF9yZXEub2Zmc2V0ICAgID0gbGUxNnRvaCgoKCh1
aW50MTZfdCkgcmVxcHRyWzVdKSA8PCA4KSArIHJlcXB0cls0XSk7IA0KDQoNCg0KUmVnYXJkcywN
Cg0KV2lsbGlhbSBMaSAoIExpIE5hbiwgwO7pqiApIA0KIA0KDQpGaXJtd2FyZSBFbmdpbmVlcmlu
ZyBQcm9mZXNzaW9uYWwNCk9wZW5Qb3dlciBBRSBUZWFtIHwgSUJNIFN5c3RlbSAmIFRlY2hub2xv
Z3kgTGFiDQpNb2JpbGU6ICs4Ni0xODYtMTA4MSA2NjA1DQoNCkJlaWppbmcsIENoaW5hDQoNCg0K
DQpGcm9tOiAgIEplcmVteSBLZXJyIDxqa0BvemxhYnMub3JnPg0KVG86ICAgICBPcGVuQk1DIFBh
dGNoZXMgPG9wZW5ibWMtcGF0Y2hlc0BzdHdjeC54eXo+LCANCm9wZW5ibWNAbGlzdHMub3psYWJz
Lm9yZw0KQ2M6ICAgICBOYW4gS1ggTGkvQ2hpbmEvSUJNQElCTUNODQpEYXRlOiAgIDA1LzMwLzIw
MTYgMTQ6MDgNClN1YmplY3Q6ICAgICAgICBSZTogW1BBVENIIG9wZW5wb3dlci1ob3N0LWlwbWkt
b2VtIHYzXSBGaXggaXNzdWU1IGZvciANCmVuZGlhbiBzYWZlDQoNCg0KDQpIaSBOYW4sDQoNCj4g
QEAgLTI5LDkgKzMwLDggQEAgaXBtaV9yZXRfdCBpcG1pX2libV9vZW1fcGFydGlhbF9lc2VsKGlw
bWlfbmV0Zm5fdCANCm5ldGZuLCBpcG1pX2NtZF90IGNtZCwNCj4gICAgICAgICAgICAgICAgZXNl
bF9yZXF1ZXN0X3QgKnJlcXB0ciA9IChlc2VsX3JlcXVlc3RfdCopIHJlcXVlc3Q7DQo+ICAgICAg
ICAgICAgICAgIEZJTEUgKmZwOw0KPiAgICAgICAgICAgICAgICBpbnQgciA9IDA7DQo+IC0gICAg
ICAgICAgICAgIC8vIFRPRE86IElzc3VlIDU6IFRoaXMgaXMgbm90IGVuZGlhbi1zYWZlLg0KPiAt
ICAgICAgICAgICAgICBzaG9ydCAqcmVjaWQgID0gIChzaG9ydCopICZyZXFwdHItPnNlbHJlY29y
ZGxzOw0KPiAtICAgICAgICAgICAgICBzaG9ydCAqb2Zmc2V0ID0gIChzaG9ydCopICZyZXFwdHIt
Pm9mZnNldGxzOw0KPiArICAgICAgICAgICAgICBzaG9ydCByZWNpZCAgPSAgbGUxNnRvaCgoKCh1
bnNpZ25lZCBzaG9ydCkgDQpyZXFwdHItPnNlbHJlY29yZG1zKSA8PCA4KSArIHJlcXB0ci0+c2Vs
cmVjb3JkbHMpOw0KPiArICAgICAgICAgICAgICBzaG9ydCBvZmZzZXQgPSAgbGUxNnRvaCgoKCh1
bnNpZ25lZCBzaG9ydCkgDQpyZXFwdHItPm9mZnNldG1zKSA8PCA4KSArIHJlcXB0ci0+b2Zmc2V0
bHMpOw0KDQpJIHRoaW5rIHRoYXQgdGhpcyBpcyBsZXNzIGNvcnJlY3QgdGhhbiB0aGUgZmlyc3Qg
YXR0ZW1wdCwgYW5kIHRoYXQncw0KcHJvYmFibHkgZHVlIHRvIGFuIGluY29ycmVjdCBzdWdnZXN0
aW9uIGZyb20gbWUuIFNvcnJ5IGZvciB0aGF0Lg0KDQpJJ3ZlIG9ubHkganVzdCBub3RpY2VkIHRo
YXQgeW91J3JlIHVzaW5nIGRpZmZlcmVudCBtZW1iZXJzIG9mIHRoZSByZXFwdHINCnN0cnVjdCB0
byBjb25zdHJ1Y3QgdGhhdCAxNi1iaXQgdmFsdWU7IHNvIHlvdXIgZmlyc3QgcGF0Y2ggcHJvYmFi
bHkgZGlkDQp0aGUgcmlnaHQgdGhpbmcuDQoNCkhvd2V2ZXI6IHdlIHNob3VsZCBmaXggdGhlIGFj
dHVhbCBzb3VyY2Ugb2YgdGhlIHByb2JsZW0gLSB0aGF0IHRoZQ0KZmllbGRzIGluIHN0cnVjdCBl
c2VsX3JlcXVlc3RfdCBhcmUgdW5uZWNlc3NhcmlseSBzcGxpdCBpbnRvIHVpbnQ4X3QNCmZpZWxk
cy4NCg0KSSB0aGluayBpdCdkIGJlIG11Y2ggYmV0dGVyIGlmIHdlIGNoYW5nZWQgZXNlbF9yZXF1
ZXN0X3QgdG8gdGhpczoNCg0KICBzdHJ1Y3QgZXNlbF9yZXF1ZXN0X3Qgew0KICAgICAgdWludDE2
X3QgIHJlc2lkOw0KICAgICAgdWludDE2X3QgIHNlbHJlY29yZDsNCiAgICAgIHVpbnQxNl90ICBv
ZmZzZXQ7DQogICAgICB1aW50OF90ICBwcm9ncmVzczsNCiAgfSAgX19hdHRyaWJ1dGVfXyAoKHBh
Y2tlZCkpIDsNCg0KLSBhbmQgZGlkIHRoZSBwcm9wZXIgY29udmVyc2lvbiB3aXRoIGxlMTZ0b2go
KS4NCg0KW0Fsc28sIHRoZSB0eXBvIGluIHRoZSBjb21taXQgdGl0bGUgaXMgc3RpbGwgcHJlc2Vu
dF0NCg0KUmVnYXJkcywNCg0KDQpKZXJlbXkNCg0KDQoNCg0K

--=_alternative 0013708048257FC7_=
Content-Transfer-Encoding: base64
Content-Type: text/html; charset="GB2312"

PGZvbnQgc2l6ZT0yIGZhY2U9InNhbnMtc2VyaWYiPkhpIEplcmVteSw8L2ZvbnQ+PGJyPjxicj48
Zm9udCBzaXplPTIgZmFjZT0ic2Fucy1zZXJpZiI+SSd2ZSB1cGRhdGVkIG15IHB1bGwgcmVxdWVz
dCA6IDwvZm9udD48YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9vcGVucG93ZXIt
aG9zdC1pcG1pLW9lbS9wdWxsLzEzIj48Zm9udCBzaXplPTIgY29sb3I9Ymx1ZSBmYWNlPSJzYW5z
LXNlcmlmIj5odHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9vcGVucG93ZXItaG9zdC1pcG1pLW9l
bS9wdWxsLzEzPC9mb250PjwvYT48Zm9udCBzaXplPTIgZmFjZT0ic2Fucy1zZXJpZiI+LjwvZm9u
dD48YnI+PGZvbnQgc2l6ZT0yIGZhY2U9InNhbnMtc2VyaWYiPlBsZWFzZSByZXZpZXcgaXQuPC9m
b250Pjxicj48YnI+PGZvbnQgc2l6ZT0yIGZhY2U9InNhbnMtc2VyaWYiPkZvciB0aGUgYWxpZ25t
ZW50IHJlcXVpcmVtZW50LCBJJ2QgdXNlDQp1bnNpZ25lZCBjaGFyIHR5cGUgdG8gYWNjZXNzIHRo
ZSByZXF1ZXN0b3IncyBidWZmZXIuIFNvOjwvZm9udD48YnI+PGJyPjxmb250IHNpemU9Mz51aW50
OF90ICpyZXFwdHIgPSAodWludDhfdCAqKSByZXF1ZXN0OyA8L2ZvbnQ+PGJyPjxicj48Zm9udCBz
aXplPTM+ZXNlbF9yZXEucmVzaWQgJm5ic3A7ICZuYnNwOyA9IGxlMTZ0b2goKCgodWludDE2X3Qp
IHJlcXB0clsxXSkNCiZsdDsmbHQ7IDgpICsgcmVxcHRyWzBdKTsgPC9mb250Pjxicj48Zm9udCBz
aXplPTM+ZXNlbF9yZXEuc2VscmVjb3JkID0gbGUxNnRvaCgoKCh1aW50MTZfdCkgcmVxcHRyWzNd
KSAmbHQ7Jmx0Ow0KOCkgKyByZXFwdHJbMl0pOyA8L2ZvbnQ+PGJyPjxmb250IHNpemU9Mz5lc2Vs
X3JlcS5vZmZzZXQgJm5ic3A7ICZuYnNwOz0gbGUxNnRvaCgoKCh1aW50MTZfdCkgcmVxcHRyWzVd
KQ0KJmx0OyZsdDsgOCkgKyByZXFwdHJbNF0pOyA8L2ZvbnQ+PGJyPjxicj48YnI+PGJyPjxmb250
IHNpemU9MyBjb2xvcj0jNDI0MjgyIGZhY2U9IkNhbGlicmkiPlJlZ2FyZHMsPC9mb250Pjxicj48
YnI+PGZvbnQgc2l6ZT0zIGNvbG9yPSM0MjQyODIgZmFjZT0iQ2FsaWJyaSI+V2lsbGlhbSBMaSAo
IExpIE5hbiwgwO7pqg0KKSA8L2ZvbnQ+PGJyPjxmb250IHNpemU9MyBjb2xvcj0jNDI0MjgyIGZh
Y2U9IkNhbGlicmkiPiZuYnNwOyAmbmJzcDs8L2ZvbnQ+PGJyPjxicj48Zm9udCBzaXplPTMgY29s
b3I9IzQyNDI4MiBmYWNlPSJDYWxpYnJpIj5GaXJtd2FyZSBFbmdpbmVlcmluZyBQcm9mZXNzaW9u
YWw8L2ZvbnQ+PGJyPjxmb250IHNpemU9MyBjb2xvcj0jNDI0MjgyIGZhY2U9IkNhbGlicmkiPk9w
ZW5Qb3dlciBBRSBUZWFtIHwgSUJNIFN5c3RlbQ0KJmFtcDsgVGVjaG5vbG9neSBMYWI8L2ZvbnQ+
PGJyPjxmb250IHNpemU9MyBjb2xvcj0jNDI0MjgyIGZhY2U9IkNhbGlicmkiPk1vYmlsZTogKzg2
LTE4Ni0xMDgxIDY2MDU8L2ZvbnQ+PGJyPjxicj48Zm9udCBzaXplPTMgY29sb3I9IzQyNDI4MiBm
YWNlPSJDYWxpYnJpIj5CZWlqaW5nLCBDaGluYTwvZm9udD48YnI+PGJyPjxicj48YnI+PGZvbnQg
c2l6ZT0xIGNvbG9yPSM1ZjVmNWYgZmFjZT0ic2Fucy1zZXJpZiI+RnJvbTogJm5ic3A7ICZuYnNw
OyAmbmJzcDsNCiZuYnNwOzwvZm9udD48Zm9udCBzaXplPTEgZmFjZT0ic2Fucy1zZXJpZiI+SmVy
ZW15IEtlcnIgJmx0O2prQG96bGFicy5vcmcmZ3Q7PC9mb250Pjxicj48Zm9udCBzaXplPTEgY29s
b3I9IzVmNWY1ZiBmYWNlPSJzYW5zLXNlcmlmIj5UbzogJm5ic3A7ICZuYnNwOyAmbmJzcDsNCiZu
YnNwOzwvZm9udD48Zm9udCBzaXplPTEgZmFjZT0ic2Fucy1zZXJpZiI+T3BlbkJNQyBQYXRjaGVz
ICZsdDtvcGVuYm1jLXBhdGNoZXNAc3R3Y3gueHl6Jmd0OywNCm9wZW5ibWNAbGlzdHMub3psYWJz
Lm9yZzwvZm9udD48YnI+PGZvbnQgc2l6ZT0xIGNvbG9yPSM1ZjVmNWYgZmFjZT0ic2Fucy1zZXJp
ZiI+Q2M6ICZuYnNwOyAmbmJzcDsgJm5ic3A7DQombmJzcDs8L2ZvbnQ+PGZvbnQgc2l6ZT0xIGZh
Y2U9InNhbnMtc2VyaWYiPk5hbiBLWCBMaS9DaGluYS9JQk1ASUJNQ048L2ZvbnQ+PGJyPjxmb250
IHNpemU9MSBjb2xvcj0jNWY1ZjVmIGZhY2U9InNhbnMtc2VyaWYiPkRhdGU6ICZuYnNwOyAmbmJz
cDsgJm5ic3A7DQombmJzcDs8L2ZvbnQ+PGZvbnQgc2l6ZT0xIGZhY2U9InNhbnMtc2VyaWYiPjA1
LzMwLzIwMTYgMTQ6MDg8L2ZvbnQ+PGJyPjxmb250IHNpemU9MSBjb2xvcj0jNWY1ZjVmIGZhY2U9
InNhbnMtc2VyaWYiPlN1YmplY3Q6ICZuYnNwOyAmbmJzcDsNCiZuYnNwOyAmbmJzcDs8L2ZvbnQ+
PGZvbnQgc2l6ZT0xIGZhY2U9InNhbnMtc2VyaWYiPlJlOiBbUEFUQ0ggb3BlbnBvd2VyLWhvc3Qt
aXBtaS1vZW0NCnYzXSBGaXggaXNzdWU1IGZvciBlbmRpYW4gc2FmZTwvZm9udD48YnI+PGhyIG5v
c2hhZGU+PGJyPjxicj48YnI+PHR0Pjxmb250IHNpemU9Mj5IaSBOYW4sPGJyPjxicj4mZ3Q7IEBA
IC0yOSw5ICszMCw4IEBAIGlwbWlfcmV0X3QgaXBtaV9pYm1fb2VtX3BhcnRpYWxfZXNlbChpcG1p
X25ldGZuX3QNCm5ldGZuLCBpcG1pX2NtZF90IGNtZCw8YnI+Jmd0OyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOw0KZXNlbF9yZXF1
ZXN0X3QgKnJlcXB0ciA9IChlc2VsX3JlcXVlc3RfdCopIHJlcXVlc3Q7PGJyPiZndDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsN
CkZJTEUgKmZwOzxicj4mZ3Q7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7DQppbnQgciA9IDA7PGJyPiZndDsgLSAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7DQovLyBUT0RPOiBJ
c3N1ZSA1OiBUaGlzIGlzIG5vdCBlbmRpYW4tc2FmZS48YnI+Jmd0OyAtICZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsNCnNob3J0ICpyZWNpZCAm
bmJzcDs9ICZuYnNwOyhzaG9ydCopICZhbXA7cmVxcHRyLSZndDtzZWxyZWNvcmRsczs8YnI+Jmd0
OyAtICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsNCnNob3J0ICpvZmZzZXQgPSAmbmJzcDsoc2hvcnQqKSAmYW1wO3JlcXB0ci0mZ3Q7b2Zmc2V0
bHM7PGJyPiZndDsgKyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7DQpzaG9ydCByZWNpZCAmbmJzcDs9ICZuYnNwO2xlMTZ0b2goKCgodW5zaWdu
ZWQgc2hvcnQpIHJlcXB0ci0mZ3Q7c2VscmVjb3JkbXMpDQombHQ7Jmx0OyA4KSArIHJlcXB0ci0m
Z3Q7c2VscmVjb3JkbHMpOzxicj4mZ3Q7ICsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOw0Kc2hvcnQgb2Zmc2V0ID0gJm5ic3A7bGUxNnRvaCgo
KCh1bnNpZ25lZCBzaG9ydCkgcmVxcHRyLSZndDtvZmZzZXRtcykgJmx0OyZsdDsNCjgpICsgcmVx
cHRyLSZndDtvZmZzZXRscyk7PGJyPjxicj5JIHRoaW5rIHRoYXQgdGhpcyBpcyBsZXNzIGNvcnJl
Y3QgdGhhbiB0aGUgZmlyc3QgYXR0ZW1wdCwgYW5kIHRoYXQnczxicj5wcm9iYWJseSBkdWUgdG8g
YW4gaW5jb3JyZWN0IHN1Z2dlc3Rpb24gZnJvbSBtZS4gU29ycnkgZm9yIHRoYXQuPGJyPjxicj5J
J3ZlIG9ubHkganVzdCBub3RpY2VkIHRoYXQgeW91J3JlIHVzaW5nIGRpZmZlcmVudCBtZW1iZXJz
IG9mIHRoZSByZXFwdHI8YnI+c3RydWN0IHRvIGNvbnN0cnVjdCB0aGF0IDE2LWJpdCB2YWx1ZTsg
c28geW91ciBmaXJzdCBwYXRjaCBwcm9iYWJseSBkaWQ8YnI+dGhlIHJpZ2h0IHRoaW5nLjxicj48
YnI+SG93ZXZlcjogd2Ugc2hvdWxkIGZpeCB0aGUgYWN0dWFsIHNvdXJjZSBvZiB0aGUgcHJvYmxl
bSAtIHRoYXQgdGhlPGJyPmZpZWxkcyBpbiBzdHJ1Y3QgZXNlbF9yZXF1ZXN0X3QgYXJlIHVubmVj
ZXNzYXJpbHkgc3BsaXQgaW50byB1aW50OF90PGJyPmZpZWxkcy48YnI+PGJyPkkgdGhpbmsgaXQn
ZCBiZSBtdWNoIGJldHRlciBpZiB3ZSBjaGFuZ2VkIGVzZWxfcmVxdWVzdF90IHRvIHRoaXM6PGJy
Pjxicj4gJm5ic3A7c3RydWN0IGVzZWxfcmVxdWVzdF90IHs8YnI+ICZuYnNwOyAmbmJzcDsgJm5i
c3A7dWludDE2X3QgJm5ic3A7cmVzaWQ7PGJyPiAmbmJzcDsgJm5ic3A7ICZuYnNwO3VpbnQxNl90
ICZuYnNwO3NlbHJlY29yZDs8YnI+ICZuYnNwOyAmbmJzcDsgJm5ic3A7dWludDE2X3QgJm5ic3A7
b2Zmc2V0Ozxicj4gJm5ic3A7ICZuYnNwOyAmbmJzcDt1aW50OF90ICZuYnNwO3Byb2dyZXNzOzxi
cj4gJm5ic3A7fSAmbmJzcDtfX2F0dHJpYnV0ZV9fICgocGFja2VkKSkgOzxicj48YnI+LSBhbmQg
ZGlkIHRoZSBwcm9wZXIgY29udmVyc2lvbiB3aXRoIGxlMTZ0b2goKS48YnI+PGJyPltBbHNvLCB0
aGUgdHlwbyBpbiB0aGUgY29tbWl0IHRpdGxlIGlzIHN0aWxsIHByZXNlbnRdPGJyPjxicj5SZWdh
cmRzLDxicj48YnI+PGJyPkplcmVteTxicj48YnI+PC9mb250PjwvdHQ+PGJyPjxCUj4NCg==
--=_alternative 0013708048257FC7_=--
