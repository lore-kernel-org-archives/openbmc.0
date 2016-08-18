Return-Path: <vishwa@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sFNd31N91zDr5T
 for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2016 21:08:37 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u7IAxxkF094720
 for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2016 07:08:34 -0400
Received: from e23smtp08.au.ibm.com (e23smtp08.au.ibm.com [202.81.31.141])
 by mx0b-001b2d01.pphosted.com with ESMTP id 24vmf1cbjx-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2016 07:08:33 -0400
Received: from localhost
 by e23smtp08.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Thu, 18 Aug 2016 21:08:31 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp08.au.ibm.com (202.81.31.205) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 18 Aug 2016 21:08:29 +1000
X-IBM-Helo: d23dlp03.au.ibm.com
X-IBM-MailFrom: vishwa@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id 17AA33578052
 for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2016 21:08:29 +1000 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u7IB8TtD25952424
 for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2016 21:08:29 +1000
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u7IB8SMq000566
 for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2016 21:08:28 +1000
Received: from [9.193.99.209] (vishwa.in.ibm.com [9.193.99.209] (may be
 forged))
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u7IB8RpQ000524
 for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2016 21:08:28 +1000
From: vishwa <vishwa@linux.vnet.ibm.com>
Subject: Document on : Time Manager in OpenBMC --> Need your review.
To: openbmc@lists.ozlabs.org
Date: Thu, 18 Aug 2016 16:38:27 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------68839A9C381DF9317CBF3073"
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16081811-0048-0000-0000-000001ADF9E7
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16081811-0049-0000-0000-0000465B8CD1
Message-Id: <c91f438b-8baa-808c-35d6-fffb928d22f1@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-08-18_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1608180125
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
X-List-Received-Date: Thu, 18 Aug 2016 11:08:39 -0000

This is a multi-part message in MIME format.
--------------68839A9C381DF9317CBF3073
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Team,

Please help look into this document that describes what I think the 
TimeManager on openBMC systems should look like.

Please weigh in your thoughts.

Thanks.

Vishwanath.

--------------68839A9C381DF9317CBF3073
Content-Type: text/plain; charset=UTF-8;
 name="TimeManager.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="TimeManager.txt"

Qk1DIFNldHRpbmdzICBpbiAvb3JnL29wZW5ibWMvc2V0dGluZ3MvSG9zdC9ob3N0MAotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKMS8uIE5l
dyBwcm9wZXJ0eSAiVGltZU1vZGUiIGFuZCB0aGUgZGVmYXVsdCB3b3VsZCBiZSBzZXQgdG8g
Ik5UUCIKCi0tPiBUaGlzIG1lYW5zLCBCTUMgd2lsbCB1c2UgdGltZXN5bmNkIHRvIHN5bmMg
dGhlIHRpbWUgd2l0aCBOVFAgc2VydmVycy4gQW55IGF0dGVtcHQgdG8gc2V0IHRoZSB0aW1l
IG1hbnVhbGx5IGlzIHJlamVjdGVkIGJ5IHRoZSB0aW1lIGRhZW1vbi4KCjEuMSkgVGhlIG9u
bHkgb3RoZXIgdmFsaWQgdmFsdWUgZm9yIHRoYXQgd291bGQgYmUgIk1hbnVhbCIuCgotLT4g
VGhpcyBtZWFucywgQk1DIHdpbGwgZGlzYWJsZSAnbnRwJyBzbyB0aGF0IG9ubHkgbWFudWFs
bHkgc2V0dGluZyB0aGUgdGltZSB3b3VsZCBiZSBhbGxvd2VkLgoKLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKMi8uIE5ldyBwcm9w
ZXJ0eSBjYWxsZWQgIlRpbWVPd25lciIgYW5kIHRoZSBkZWZhdWx0IHdvdWxkIGJlIHNldCB0
byAiQk1DIgoKMi4xKSBUaGUgb3RoZXIgcG9zc2libGUgdmFsdWVzIHdvdWxkIGJlICJIb3N0
IiAvICJTcGxpdCIgLyAiQm90aCIuCgpPd25lciAqQk1DKjogQk1DIGNhbiBoYXZlIE5UUCAv
IE5vbi1OVFAgYXMgQk1DJ3Mgc291cmNlIG9mIHRpbWUuCiAtLT4gVGhpcyBhbHNvIG1lYW5z
IHRoYXQsIHdoZW4gaG9zdCBzZW5kcyBTRVRfU0VMLCBCTUMganVzdCByZXNwb25kcyB3aXRo
IHN1Y2Nlc3MgYW5kIHdoZW4gaG9zdCBhc2tzIEdFVF9TRUwsIEJNQydzIHRpbWUgaXMgcmV0
dXJuZWQuCgoqKgoKT3duZXIgKkhvc3QqOiBCTUMgY2FuICpub3QqIHNldCB0aGUgdGltZSBv
biBpdHMgb3duIGFuZCBuZWVkIHRvIHdhaXQgZm9yIGhvc3QncyBJUE1JIG1lc3NhZ2UgdG8g
c2V0IGFuZCB0aGlzIGlzIHdoeSB0aGlzIGlzIG5vdCBkZWZhdWx0LgoKKioKCk93bmVyICpT
cGxpdCo6IEJNQyBpcyBmcmVlIHRvIGNob29zZSBlaXRoZXIgTWFudWFsIC1vci0gTlRQIHRv
IHNldCBCTUMgdGltZSwgaG93ZXZlciwgd2hlbiBob3N0IHNlbmRzIHRoZSB0aW1lIGRvd24s
IHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gaG9zdCdzIHRpbWUgYW5kIEJNQydzIHRpbWUgaXMg
Y2FsY3VsYXRlZCBhbmQgaXMgc3RvcmVkIGluIGEgcGVyc2lzdGVudCBhcmVhLiBUaGlzIG9m
ZnNldCBpcyBrZXB0IHVwLXRvLWRhdGUgd2hlbmV2ZXIgdGhlIHRpbWUgY2hhbmdlcyBvbiB0
aGUgQk1DICggVXNpbmcgdGltZXJmZF9zZXR0aW1lIHdpdGggVEZEX1RJTUVSX0NBTkNFTF9P
Tl9TRVQgKS4KCi0tPiBXaGVuIGhvc3QgYXNrcyB0aW1lLCB0aGUgQk1DJ3MgdGltZSBpcyBy
ZWFkIGFuZCB0aGVuIGZhY3RvcnMgaW4gdGhlIG9mZnNldCBhbmQgcmV0dXJucyBpdC4KCioq
CgpPd25lciAqQm90aCogOiBTYW1lIGFzIEJNQyBvd25zIHRoZSBjbG9jayBidXQganVzdCB0
aGF0IHdoZW4gSG9zdCBzZW5kcyBTRVRfU0VMIHRpbWUsIHRoZSB0aW1lIG9uIEJNQyBpcyBz
ZXQgdG8gdmFsdWUgZ2l2ZW4gYnkgaG9zdC4KCj09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KCkFQSSdzIGRlZmluZWQgdGhhdCBp
cyBleHBvcnRlZCBieSBCTUMgYW5kIGFjY2Vzc2libGUgYnkgUkVTVCAoIE1vZGlmaWVkIG9u
bHkgaWYgcG9saWN5IGFsbG93cyBpdCApLgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KCjEvLiAvb3JnL29wZW5ibWMvVGltZU1hbmFnZXIvU2V0VGlt
ZSAodGltZV9zdHJpbmdfaW5fJVktJW0tJWQgJUg6JU06JVMgKS4gLS0+IFNldCBCTUMgVGlt
ZSBwZXIgdGhlIHVzZXIgaW5wdXQuCgogICAgLS0+IFRoaXMgZm9ybWF0IGlzIHRoZW4gdXNl
ZCBieSBzdHJwdGltZSBhbmQgdXNlcyBta3RpbWUgdG8gY29udmVydCBpdCB0byBudW1fc2Vj
b25kcyBhbmQgY2FsbHMgL29yZy9mcmVlZGVza3RvcC90aW1lZGF0ZTEvU2V0VGltZSBjb252
ZXJ0ZWQgdG8gdXNlYwoKICAgIC0tPiBBbHRob3VnaCBzdHJwdGltZSBzdXBwb3J0IHdob2xl
IGxvdCBvZiBvdGhlciBmb3JtYXRzLCBJIHRoaW5rIHRoaXMgb25lIHdheSBpcyBlbm91Z2gu
CgoqKgoKMi8uIC9vcmcvb3BlbmJtYy9UaW1lTWFuYWdlci9HZXRUaW1lIChyZXR1cm5zIGN0
aW1lICkgLT4gR2V0IEJNQyBUaW1lLgoKICAgIC0tPiBJZiBjYWxsZXIgaXMgSVBNSV9HRVRf
U0VMIGFuZCB0aGUgbW9kZSBpcyAic3BsaXQiLCB0aGVuIHRoZSBob3N0LW9mZnNldCBpcyBh
ZGRlZCB0byB0aGlzIGFuZCByZXR1cm5lZCwgZWxzZSByZXR1cm4gd2hhdCBpcyByZWFkIG9u
IEJNQy4KCioqCgozLy4gL29yZy9vcGVuYm1jL1RpbWVNYW5hZ2VyL1NldE5UUCAoc3RyaW5n
ICd5ZXNfb3Jfbm8nKSAtLT4gRW5hYmxlIC8gRGlzYWJsZSBOVFAgQCBCTUMuCgogICAgLS0+
IENhbGxzIC9vcmcvZnJlZWRlc2t0b3AvdGltZWRhdGUxL1NldE5UUCB3aXRoICcxJyBvciAn
MCcgYW5kIHRoYXQgd291bGQgaGFuZGxlIHBhdXNpbmcgdGltZXN5bmNkLgoKKioKCk5PVEUg
OjogVGhlIGVhc2lldCB0aGluZyB3b3VsZCBiZSB0byBkbyBhICJzeXN0ZW1kKHRpbWVkYXRl
Y3RsIDx1c2VyIHJlcXVlc3Q+KSIgc28gbW9zdGx5IGFsbCBpcyBoYW5kbGVkIGJ5IHN5c3Rl
bWQgYnV0IHRoZSBvbmx5IGRyYXcgYmFjayBJIHNlZSBpcyB0aGUgbmV3IGZvcmsgYW5kIEkg
YmVsaWV2ZSB0aGlzIG1heSBub3QgYmUgYSBjb3JyZWN0IGFwcHJvYWNoLgoKKioKCjQvLiBU
aW1lTWFuYWdlciB3YXRjaGVzIGZvciBQcm9wZXJ0eUNoYW5nZWQgZXZlbnRzIGZyb20gL29y
Zy9vcGVuYm1jL3NldHRpbmdzL0hvc3QvaG9zdDAgYW5kIHdvdWxkIHJlYWQgdGhlIGNoYW5n
ZWQgc2V0dGluZ3MgYW5kIHRha2UgYXBwcm9wcmlhdGUgYWN0aW9ucyA6CgpBY3Rpb25zIGNv
dWxkIGJlIDoKLS0tLS0tLS0tLS0tLS0tLS0KCjQuMS8uIElmIHRoZSBUaW1lTW9kZSBpcyBj
aGFuZ2VkIGJldHdlZW4gQk1DPC0tPk1hbnVhbCwgdGhlbiB3aGF0ZXZlciBhc2tlZCBmb3Ig
aXMgZW5hYmxlZCAvIGRpc2FibGVkIGlzIGhvbm9yZWQgYXQgYW55dGltZS4KCjQuMi8uICBJ
ZiB0aGUgVGltZXJNb2RlIGFza2VkIGlzIHRvIGNoYW5nZSB0byAiaG9zdCBvd25zIHRoZSBj
bG9jayIgLU9SLSAic3BsaXQgY2xvY2siLCB0aGVuIHRoZSB2YWx1ZSBvZiBbcGdvb2RdIGlz
IHJlYWQuIElmIHRoYXQgaXMgW29uXSwgdGhlbiB0aGUgcmVxdWVzdCBpcyAgCgogICAgICAg
aWdub3JlZCBzaW5jZSBpdCB3b3VsZCBub3QgYmUgc2FmZSB0byBjaGFuZ2UgdG8gdGhlc2Ug
bW9kZXMgd2hlbiB0aGluZ3MgYXJlIHJ1bm5pbmcuCgogICAgICAgLS0+IE9uIGEgc3VjY2Vz
c2Z1bCBwb2xpY3kgY2hhbmdlLCB0aGUgaG9zdF9vZmZzZXQgaXMgbnVsbGlmaWVkLgoKNC4z
LyAgaWYgdGhlIFRpbWVyTW9kZSBhc2tlZCBpcyB0byBjaGFuZ2UgdG8gIkJNQyBvd25zIHRo
ZSBjbG9jayIgLU9SLSAiQm90aCIsIHRoZW4gdGhlICJob3N0X29mZnNldCIgd291bGQgYmUg
aW52YWxpZGF0ZWQgYW5kIHRoZSByZXF1ZXN0IGlzIGhvbm9yZWQuCgoqKgoKNS8uIFRpbWVN
YW5hZ2VyIHdhdGNoZXMgZm9yIHRpbWUgY2hhbmdlcyBpbiBCTUMgZHVlIHRvIGFueSBzb3Vy
Y2UgYnkgd2F0Y2hpbmcgZm9yIFRGRF9USU1FUl9DQU5DRUxfT05fU0VUIGFuZCB0aGVuIHVw
ZGF0ZXMgdGhlIGhvc3Rfb2Zmc2V0IGlmIHRoZSBPd25lciBpcyBzZXQgdG8gc3BsaXQuCgo9
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PQoKQ2hhbmdlcyB0byBFeGlzdGluZyAvb3JnL29wZW5ibWMvTmV0d29ya01hbmFnZXIv
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKMS8u
IFNldEFkZHJlc3M0IG5vdyB0YWtlcyBpbiBhbm90aGVyIGZpZWxkIGNhbGxlZCAiTlRQIiBh
bmQgdXNlciBuZWVkIHRvIGdpdmUgIiIgaWYgdGhleSBkbyBub3Qgd2FudCB0byBzdXBwbHkg
TlRQIGF0IHRoZSB0aW1lIG9mIG5ldGNvbmYuCjIvLiBTZXRESENQIG5vdyB0YWtlcyBpbiBh
bm90aGVyIGZpZWxkIGNhbGxlZCAiVXNlTlRQIiBhbmQgdGhlIHVzZXIgbmVlZHMgdG8gZ2l2
ZSAieWVzIi8ibm8iLyIiIGFuZCB0aGUgIiIgdGhlIHNhbWUgd291bGQgYmUgcHV0IGFzIFVz
ZU5UUD0gdW5kZXIgREhDUCBzZWN0aW9uLgozLy4gQSBuZXcgQVBJIHRoYXQgd2lsbCB0YWtl
IGluICJpbnRlcmZhY2UgbmFtZSIgYW5kICJsaXN0IG9mIE5UUCIgYW5kIHdvdWxkIGdvIGFo
ZWFkIHVwZGF0ZSB0aGUgc3RhdGljIC5uZXR3b3JrIGZpbGUgb3IgaW4gREhDUCBzZWN0aW9u
LgoKPT09PT09PT09PT09PT09PT09PT09CgpOb3RlczoKCjEvLiBzZF9ldmVudCBsb29wIGlz
IHVzZWQgc28gdGhhdCB0aGUgcmVxdWVzdHMgYXJlIHNlcmlhbGl6ZWQgYnkgU0RfQlVTLgoy
Ly4gdGltZXJmZF9zZXR0aW1lIGlzIHVzZWQgd2l0aCBURkRfVElNRVJfQ0FOQ0VMX09OX1NF
VCBzbyB0aGF0IHdlIGdldCB3b2tlbiB1cCBvbmx5IHdoZW4gdGhlcmUgaXMgYSB0aW1lIGlz
IHNldC4KCgo=
--------------68839A9C381DF9317CBF3073--
