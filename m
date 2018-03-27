Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="IgBlKtWT"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 409ZnT49WpzF2Ct
 for <openbmc@lists.ozlabs.org>; Wed, 28 Mar 2018 02:34:37 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 039AA539FD
 for <openbmc@lists.ozlabs.org>; Tue, 27 Mar 2018 15:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:from:from:references:subject:subject
 :received:received:received; s=mta-01; t=1522164869; x=
 1523979270; bh=3rCju8Zcx0YdfeKxXLxxKVPDtRb9WpdJEyngwyYHcJI=; b=I
 gBlKtWTlQS7xiTGdDuRY9OFGdFAP+Ynbm8rchg8XyU9VJRd7bXwXn6XemCUs3tfW
 /0lpj0pentBh42Ov1sR44lcNg9nrQlyUCOX7mab7nNNPC7OhffluRMAlPvC/yS5V
 hSgOVJdKKDCuWxehODOb0o8YeuZ9D+LWdsCkOi+NSU=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iP9TzfuWRtaP for <openbmc@lists.ozlabs.org>;
 Tue, 27 Mar 2018 18:34:29 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 414365396C
 for <openbmc@lists.ozlabs.org>; Tue, 27 Mar 2018 18:34:29 +0300 (MSK)
Received: from [172.17.14.168] (172.17.14.168) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 27
 Mar 2018 18:34:28 +0300
Subject: Re: RFC for Implement SNMP trap on openBMC.
To: <openbmc@lists.ozlabs.org>
References: <4d0a0aa4-bd51-f72c-af18-5842d1f08456@linux.vnet.ibm.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Message-ID: <47f8c0ef-f280-88e0-6145-7014ff90d6f3@yadro.com>
Date: Tue, 27 Mar 2018 18:34:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <4d0a0aa4-bd51-f72c-af18-5842d1f08456@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Zp1Zvij4ZGrNx9gzxW04W03teROboNTqP"
X-Originating-IP: [172.17.14.168]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Mar 2018 15:34:38 -0000

--Zp1Zvij4ZGrNx9gzxW04W03teROboNTqP
Content-Type: multipart/mixed; boundary="8qT55TMRKfQcIJMSos2p3kjbYtssTT759";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: openbmc@lists.ozlabs.org
Message-ID: <47f8c0ef-f280-88e0-6145-7014ff90d6f3@yadro.com>
Subject: Re: RFC for Implement SNMP trap on openBMC.
References: <4d0a0aa4-bd51-f72c-af18-5842d1f08456@linux.vnet.ibm.com>
In-Reply-To: <4d0a0aa4-bd51-f72c-af18-5842d1f08456@linux.vnet.ibm.com>

--8qT55TMRKfQcIJMSos2p3kjbYtssTT759
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
Content-Language: en-US

SSBwZXJzb25hbGx5IHRoaW5rIHRoYXQgR2l0SHViIGlzc3VlIGlzIHRoZSBiZXN0IHBsYWNl
IGZvciBzdWNoCmRpc2N1c3Npb24gYXMgaXQgYWxsb3dzIHRvIGhhdmUgaW4gb25lIHBsYWNl
IGFsbCB0aGUgYmFja2dyb3VuZCBmb3IgdGhlCnRha2VuIGRlY2lzaW9uIG9uY2UgdGhlIGZl
YXR1cmUgaXMgaW1wbGVtZW50ZWQuCgpJIGhhdmUgcG9zdGVkIGEgbGluayB0aGVyZSB0byBv
dXIgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBvZiBTTk1QIHN1cHBvcnQKZm9yIE9wZW5CTUMu
CgpJdCBpcyBmYXIgZnJvbSBiZWluZyBpZGVhbCBhbmQgY3VycmVudGx5IG9ubHkgc3VwcG9y
dHMgWUFEUk8gTUlCLgpTdXBwb3J0IGZvciBvdGhlciBJQU5BIGVudGVycHJpc2UgbnVtYmVy
cyBhbmQgb3RoZXIgTUlCcyBpcyB5ZXQgdG8gYmUKYWRkZWQgKHlvdSdyZSBhbGwgd2VsY29t
ZSB0byBkbyBzbykuCgpQbGVhc2UgdGFrZSBhIGxvb2sgYXQgaHR0cHM6Ly9naXRodWIuY29t
L1lBRFJPLUtOUy9waG9zcGhvci1zbm1wCgpBbGV4YW5kZXIKCjE3LjAzLjIwMTggMTQ6NDcs
IFJhdGFuIEd1cHRhIHdyb3RlOgo+IEhpIEFsbCwKPgo+IEkgYW0gd29ya2luZyBvbiB0aGUK
PiBpc3N1ZShodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9vcGVuYm1jL2lzc3Vlcy8zMDAy
KSB0byBJbXBsZW1lbnQKPiBTTk1QIHRyYXAgbm90aWZpY2F0aW9uIHN1cHBvcnQgb24gb3Bl
bkJNQy4KPiBJIHdvdWxkIGJlIGV4cGxhaW5pbmcgYSByb3VnaCBpZGVhIG9mIGhvdyB3ZSBw
bGFuIHRvIGdvIGFib3V0Lgo+IFBsZWFzZSBzaGFyZSB5b3VyIHRob3VnaHRzIGFuZCBmZWVk
YmFjayBvbiB0aGlzIHByb3Bvc2FsLgo+Cj4gUmVxdWlyZW1lbnQ6LSBFbmFibGUgc3VwcG9y
dCBmb3IgU05NUCB0cmFwIG5vdGlmaWNhdGlvbiBvbiBvcGVuYm1jLgo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIEN1cnJlbnRseSB0aGUgcmVxdWlyZW1lbnQgaXMgdG8gc2VuZCB0
aGUgU05NUCB0cmFwIGluCj4gdGhlIGZvbGxvd2luZyBjYXNlcwo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIDEpIFdoZW5ldmVyIHRoZSBlcnJvciBsb2cgZ2V0cyBjcmVhdGVkLgo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDIpIFdoZW5ldmVyIHRoZSBCTUMgc3RhdGUg
Y2hhbmdlcyB0byBydW50aW1lLgo+Cj4gTk9URTotIEluIGZ1dHVyZSBXZSB3b3VsZCBleHRl
bmQgdGhlIHN1cHBvcnQgb2Ygc2VuZGluZyB0cmFwIGluIG90aGVyCj4gdXNlIGNhc2VzLgo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDEpIFNlbmRpbmcgdGhlIHNlbnNvciB0ZWxl
bWV0cnkgZGF0YS4KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAyKSBBcHBsaWNhdGlv
biBzcGVjaWZpYyB1c2UgY2FzZXMuCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGVnOi0gTXVsdGlwbGUgQXV0aGVudGljYXRpb24gZmFpbHVyZS4KPgo+IENvbmZp
Z3VyYWJsZSBUcmFwIFBhcmFtZXRlcnMKPiA9PT09PT09PT09PT09PT09PT09Cj4KPiAxKSBN
YW5hZ2VyIElQCj4gMikgSW50ZXJlc3RlZCBUcmFwIHR5cGVzCj4gwqDCoMKgIE5vdGljZQo+
IMKgwqDCoMKgwqDCoMKgIFdhcm5pbmcKPiDCoMKgwqDCoMKgwqDCoCBDcml0aWNhbAo+Cj4K
PiBIb3cgdG8gY29uZmlndXJlIHRoZSBTTk1QIE1hbmFnZXIgSVAgb24gYm1jPwo+Cj4gLSBU
aHJvdWdoIFJFU1QgKGFuZCBoZW5jZSBELUJ1cykgQVBJCj4KPiBXZSBjYW4gZGVmaW5lIHRo
ZSBNSUIgc3RydWN0dXJlIGRlcGVuZGluZyBvbiB0aGUgZXZlbnRUeXBlCj4KPiBlZwo+Cj4g
PT0+ZXZlbnRUeXBlID0gRXJyb3JMb2cKPgo+IFN0cnVjdHVyZSBmb3IgZXJyb3JMb2cgTUlC
Cj4gPT09PT09PT09PT09PT09PQo+IEFnZW50SVDCoMKgIDrCoMKgIEJNQyBJUCBBZGRyZXNz
Cj4gVGltZVN0YW1wIDrCoMKgIFRpbWUgd2hlbiB0aGUgdHJhcCBnZW5lcmF0ZWQKPiBkZXZp
Y2VOYW1lOi3CoCBEYnVzT2JqZWN0UGF0aAo+IGFsZXJ0TGV2ZWw6LcKgIFdvdWxkIGJlIGdp
dmVuIGJ5IHRoZSBjb25maWcgeWFtbAo+IMKgwqDCoCBGb2xsb3dpbmcgcHJvcGVydGllcyBk
YXRhIHdvdWxkIGJlIGZldGNoZWQgYnkgbWFraW5nIERidXMgY2FsbCBvbgo+IHRoYXQgb2Jq
ZWN0Lgo+IEVycm9ySWQ6Cj4gRXJyb3JTZXZlcml0eToKPiBFcnJvck1lc3NhZ2U6Cj4gRXJy
b3JBZGRpdGlvbmFsRGF0YXthcnJheSBvZiBrZXkgdmFsdWV9Ogo+IEVycm9yUmVzb2x1dGlv
blN0YXR1czoKPgo+ID09PT5ldmVudFR5cGUgPSBDb25maWd1cmF0aW9uCj4gQWdlbnRJUMKg
wqAgOsKgwqAgQk1DIElQIEFkZHJlc3MKPiBUaW1lU3RhbXAgOsKgwqAgVGltZSB3aGVuIHRo
ZSB0cmFwIGdlbmVyYXRlZAo+IGRldmljZU5hbWU6LcKgIERidXNPYmplY3RQYXRoCj4gYWxl
cnRMZXZlbDotwqAgV291bGQgYmUgZ2l2ZW4gYnkgdGhlIGNvbmZpZyB5YW1sCj4gZXZlbnRN
ZXNzYWdlOi0gIkJNQyBzdGF0ZSBjaGFuZ2VkIgo+IFByb3BlcnR5TmFtZTotCj4gUHJvcGVy
dHlWYWx1ZTotCj4KPiBJbXBsZW1lbnQgdGhlIHNubXAgdHJhcCBmZWF0dXJlCj4gPT09PT09
PT09PT09PT09PT09PT09Cj4KPiBDdXJyZW50bHkgb24gb3BlbmJtYyB0aGUgZGF0YSBpcyBi
ZWluZyBtb2RlbGVkIGFzIEQtYnVzIE9iamVjdCBzbyB3ZQo+IHdvdWxkIGJlCj4gbGV2ZXJh
Z2luZyB0aGUgY2FwYWJpbGl0aWVzIGdpdmVuIGJ5IHRoZSBleGlzdGluZwo+IGFwcChwaG9z
cGhvci1EYnVzLU1vbml0b3IpIHRvIGdldCB0aGUKPiB0cmlnZ2VycyBvbiBmb2xsb3dpbmcg
Y29uZGl0aW9ucyB0byBnZW5lcmF0ZSB0aGUgc25tcCB0cmFwLgo+Cj4gMSkgd2hlbmV2ZXIg
dGhlIG5ldyBvYmplY3QgZ2V0cyBhZGRlZAo+IMKgwqDCoMKgwqAgZWcgZXJyb3Igb2JqZWN0
IHVuZGVyIC94eXovb3BlbmJtY19wcm9qZWN0L0xvZ2dpbmcKPgo+IDIpIFRoZXJlIGlzIHNv
bWUgcHJvcGVydHkgY2hhbmdlIG9uIHRoZSBjb25maWd1cmVkIEQtYnVzIG9iamVjdAo+IMKg
wqDCoMKgwqAgZWcgTmV0d29yayBjb25maWd1cmF0aW9uIGNoYW5nZS4KPgo+IDMpIFNvbWUg
cHJvcGVydHkgcmVhY2hlZCBhIHNwZWNpZmljIHZhbHVlL3RocmVzaG9sZCB2YWx1ZS4KPiDC
oMKgwqDCoMKgIGVnIEJNQyBzdGF0ZSBjaGFuZ2UgdG8gInBvd2Vyb24iIG9yIENQVSB0ZW1w
ZXJhdHVyZSBpcyA+IFgKPgo+IE5PVEU6LSBUaGVyZSBjb3VsZCBiZSBjYXNlcyB3aGljaCBp
cyBpbmRlcGVuZGVudCBvbiB0aGUgRC1idXMgb2JqZWN0Cj4gwqDCoMKgwqDCoMKgIGVnOi0g
R2VuZXJhdGUgYSB0cmFwIHdoZW5ldmVyIHRoZXJlIGlzIG11bHRpcGxlIGF1dGhlbnRpY2F0
aW9uCj4gZmFpbHVyZQo+IMKgwqDCoMKgwqDCoCBXZSB3b3VsZCBleHBvc2UgYSBELWJ1cyBh
cGkgdG8gZ2VuZXJhdGUgYSB0cmFwIHRvIGhhbmRsZQo+IGFwcGxpY2F0aW9uCj4gwqDCoMKg
wqDCoMKgIHNwZWNpZmljIHVzZSBjYXNlcy4KPgo+IENvbmZpZyBZQU1MIG9mIFBob3NwaG9y
LURidXMtTW9uaXRvcgo+ID09PT09PT09PT09PT09PT09PT09PT09PQo+IC0gbmFtZTogY3Jl
YXRlIHByb3BlcnR5IGV2ZW50Cj4gwqAgY2xhc3M6IGNhbGxiYWNrCj4gwqAgY2FsbGJhY2s6
IHNubXBFdmVudAo+IMKgIHBhdGhzOiBELWJ1cyBwYXRoIGdyb3VwCj4gwqAgcHJvcGVydGll
czogR3JvdXAgb2YgaW50ZXJlc3RlZCBQcm9wZXJ0aWVzCj4gwqAgZXZlbnRTZXZlcml0eTog
Tm90aWNlL1dhcm5pbmcvQ3JpdGljYWwKPiDCoCBldmVudFR5cGU6IEVycm9yIGxvZyAvIFNl
bnNvciAvIFN0YXRlLgo+IMKgIGV2ZW50TWVzc2FnZTogIlVzZXIgY2FuIGdpdmUgdGhlIG1l
c3NhZ2UgYXMgcGVyIHRoZSBldmVudFR5cGUiCj4gwqDCoMKgwqDCoMKgwqDCoCBQcm9wZXJ0
eUNoYW5nZTotIE5vcm1hbCBwcm9wZXJ0eSBDaGFuZ2UgY291bGQgYmUgZXZlbnRUeXBlIGFz
Cj4gTm90aWNlIGVnOi0gU3RhdGVDaGFuZ2UvTmV0d29yayBDb25maWd1cmF0aW9uIGNoYW5n
ZQo+IMKgwqDCoMKgwqDCoMKgwqAgUHJvcGVydHlDaGFuZ2Ugd291bGQgYmVjb21lIFdhcm5p
bmc6LSBpZiB3ZSBoYXZlIG1ldCBhCj4gc3BlY2lmaWMgY29uZGl0aW9uIG9uIGEgcHJvcGVy
dHkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGVnIFByb2MgVGVtcHJhdHVyZSA+IHNvbWUgY29uZmlndXJlZAo+IHRlbXBlcmF0dXJl
IHZhbHVlLgo+Cj4gT3BlbnNvdXJjZTotIE5ldFNubXAKPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgQ29tZXMgdXAgd2l0aCBmdWxsIHN1aXRlIG9mIHRvb2xzIGxpa2Ugc25tcAo+IGFn
ZW50LHNubXB0cmFwZCwgbWliMmMsIGJ1bmNoIG9mIG90aGVyIHRvb2xzCj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIEN1cnJlbnRseSB0aGUgc3VwcG9ydCBpcyBmb3IgdHJhcCBzbyB3
ZSBuZWVkIG1pbmltYWwgb2YKPiBhYm92ZShsaWJzbm1wLG1pYjJjKS4KPgo+IFJlZ2FyZHMK
Pgo+IFJhdGFuIEd1cHRhCj4KCg==

--8qT55TMRKfQcIJMSos2p3kjbYtssTT759--

--Zp1Zvij4ZGrNx9gzxW04W03teROboNTqP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJaumR+AAoJEOiTWHtbdBeNKMMP/0tTO2f+e89X70aajb9PyU6F
RDlkDe9f/rtDpzo/++CZCuMiPlsu4UNF+zz1CRY0ON02LWGLxPpOOLU48Ds6HDGL
r9eQHUoqvU7GclNEifDgHf4QPWDCmOY9KC/YFRyUSonVW7gdZdWFSArFeD+LaKXP
sN8hDvCa8LSx61NSJEmHij5kxgcUzPMYJVTsQXy+AYW+vx8PNGbnJqRdN6Od2vVT
3BE8Wr7eToK1+x/fhFGNCdfivOhOSKZ4y4WJCWdVikjk80KPMPX53vCMqoB+jj3u
z0enVsBmMRJupXtGSJV5vPoOfdOt95Spsq8q/Me13da4ZUMvA4iUR6oLa/T9Scga
LRWq1bvL9FYHY65NNRSg0Fgpmovr3KwNjfQP4vWPQUM9mGC5ICOue4NQzeG4Qud1
xw6m+X3Uv79Y/o1Wr42OaRTDjiEhPJ1srrHGYg/xfe6QJKS+agUbe5JDeuDH4hO+
d5H5hZwLavcd0/Ipz+VdmVrlP1tWgd4RDt9yfE3I6LsA6GXWlC4o2XPaOoO8renw
brK3aO/j9JrKXU6obbkcl8oyUhPwEcy/ewwVr5YFhv1MO5u2QMGwIjvsHdgZLXk4
TAjFp3ht84QlxrX/6sEgXCgzgBNNqMP4tJ/t7AyhUbQaCMKvYdNI5xwlc/E8jBg1
xwAa4IbVgj6g4pqDkTqG
=bhcM
-----END PGP SIGNATURE-----

--Zp1Zvij4ZGrNx9gzxW04W03teROboNTqP--
