Return-Path: <wvervoorn@eltan.com>
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=eltan.com
 (client-ip=213.75.39.8; helo=cpsmtpb-ews05.kpnxchange.com;
 envelope-from=wvervoorn@eltan.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=eltan.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="GpbGn/5J"; 
 dkim-atps=neutral
Received: from cpsmtpb-ews05.kpnxchange.com (cpsmtpb-ews05.kpnxchange.com
 [213.75.39.8])
 by lists.ozlabs.org (Postfix) with ESMTP id 441hMH1tzmzDqcp
 for <openbmc@lists.ozlabs.org>; Sat, 16 Feb 2019 18:19:06 +1100 (AEDT)
Received: from cpsps-ews26.kpnxchange.com ([10.94.84.192]) by
 cpsmtpb-ews05.kpnxchange.com with Microsoft SMTPSVC(7.5.7601.17514); 
 Sat, 16 Feb 2019 08:19:02 +0100
X-Brand: 7Ljiz6bi2A==
X-KPN-SpamVerdict: e1=0;e2=0;e3=0;e4=(e4=10;e1=10;e2=11;e3=10);EVW:Whi
 te;BM:NotScanned;FinalVerdict:Clean
X-CMAE-Analysis: v=2.3 cv=UOIM4xXy c=1 sm=1 tr=0
 a=qDt3RXe/W/RMJVjRtURR+Q==:117 a=+94oq0dzjs5YbdIDA+8OCg==:17
 a=xqWC_Br6kY4A:10 a=CFTnQlWoA9kA:10 a=FOH2dFAWAAAA:8 a=voM4FWlXAAAA:8
 a=X5F7dNyOAAAA:8 a=9EtzjIcKfHNKvmLtKhAA:9 a=D5y4OPxHJo--O23F:21
 a=_pzieqDus7-nmB8I:21 a=QEXdDO2ut3YA:10 a=N8Lo1w8Ha9H9sntpyxUA:9
 a=MSPlWNCmBZzkbHNn:21 a=_W_S_7VecoQA:10 a=frz4AuCg-hUA:10
 a=i3VuKzQdj-NEYjvDI-p3:22 a=IC2XNlieTeVoXbcui8wp:22
 a=pS7LufLo7ZPxIL5li5Lt:22
X-CM-AcctID: kpn@feedback.cloudmark.com
Received: from CPSMTPM-CMT106.kpnxchange.com ([195.121.3.22]) by
 cpsps-ews26.kpnxchange.com with Microsoft SMTPSVC(8.5.9600.16384); 
 Sat, 16 Feb 2019 08:19:02 +0100
Content-Language: nl-NL
Content-Type: multipart/alternative;
 boundary="_000_ca9f5aa5d0be44bbb7262dec846c60a0emailandroidcom_"
DKIM-Signature: v=1; a=rsa-sha256; d=kpnmail.nl; s=kpnmail01;
 c=relaxed/relaxed; t=1550301542;
 h=mime-version:date:message-id:subject:from:to:content-type;
 bh=q6+PYPhLPbaYAKntZGd4Gv+xpASS1sXv5sHPfrEPr/o=;
 b=GpbGn/5JqJ3PVuRt3kBv7ZTORyMYG89zOi5JqQPKICFq3wTWPU6b2Ff6RPA15a4M1f48hY5bAbY
 lVKUtM60IFK4207zR1qPEfgsKmbjRneOd8ioC43SRA1wzQSwaGr/WGYgl+gocMGb6+1RiTuyr3H3S
 PE8bz0aDjLpvwNsw0Jc=
Received: from Eltsrv03.Eltan.local ([84.85.114.86]) by
 CPSMTPM-CMT106.kpnxchange.com over TLS secured channel with Microsoft
 SMTPSVC(8.5.9600.16384); Sat, 16 Feb 2019 08:19:02 +0100
Received: from Eltsrv03.Eltan.local (192.168.100.3) by Eltsrv03.Eltan.local
 (192.168.100.3) with Microsoft SMTP Server (TLS) id 15.0.847.32; Sat, 16 Feb
 2019 08:18:18 +0100
Received: from Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8]) by
 Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8%12]) with mapi id
 15.00.0847.040; Sat, 16 Feb 2019 08:17:59 +0100
From: Wim Vervoorn <wvervoorn@eltan.com>
To: Vijay Khemka <vijaykhemka@fb.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Adding IPMI support to an existing implementation
Thread-Topic: Adding IPMI support to an existing implementation
Thread-Index: AdTFIDsr8pTdO/3NT8aRBIZaZyiwgwACgNuAACdgIn0=
Date: Sat, 16 Feb 2019 07:17:59 +0000
Message-ID: <ca9f5aa5-d0be-44bb-b726-2dec846c60a0@email.android.com>
References: <5cb3deac47694e52afdf214837928110@Eltsrv03.Eltan.local>,
 <6E1BC227-2D18-43DA-94C1-2B726BC37B3D@fb.com>
In-Reply-To: <6E1BC227-2D18-43DA-94C1-2B726BC37B3D@fb.com>
Accept-Language: nl-NL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
X-OriginalArrivalTime: 16 Feb 2019 07:19:02.0255 (UTC)
 FILETIME=[E473DFF0:01D4C5C7]
X-RcptDomain: lists.ozlabs.org
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Feb 2019 07:19:08 -0000

--_000_ca9f5aa5d0be44bbb7262dec846c60a0emailandroidcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QXQgdGhpcyBwb2ludCBJJ20gbm90IGxvb2tpbmcgZm9yIGFkZGl0aW9uYWwgT0VNIGNvbW1hbmRz
Lg0KDQpNeSBtYWluIGdvYWwgaXMganVzdCB0byBhZGQgYWxsIHN1cHBvcnQgcmVxdWVzdCB0byBl
bmFibGUgaW5iYW5kIGlwbWkgd2l0aCBLQ1MgaW50ZXJmYWNlLiAgVGhlIG1vc3QgaW1wb3J0YW50
IHRoaW5nIGlzIHRoYXQgdGhlIHN5c3RlbSBpcyBjYXBhYmxlIHRvIHByb3ZpZGUgdGhlIGludmVu
dG9yeSBhbmQgZXZlbnRsb2cgaW5mb3JtYXRpb24gdG8gdGhlIEJNQyBkdXJpbmcgYm9vdC4NCg0K
VGhlIGluZm9ybWF0aW9uIEkgYW0gbG9va2luZyBmb3IgYXJlIGl0ZW1zIGxpa2UuIFdoaWNoIHNl
cnZpY2VzIG5lZWQgdG8gYmUgaW5jbHVkZWQgYW5kIHdoYXQgZG8gSSBuZWVkIHRvIGNvbmZpZ3Vy
ZSB0byBtYWtlIGl0IHdvcmsuDQoNCkJlc3QgcmVnYXJkcywNCg0KV2ltIFZlcnZvb3JuDQoNCk9w
IDE1IGZlYi4gMjAxOSA5OjMxIHAubS4gc2NocmVlZiBWaWpheSBLaGVta2EgPHZpamF5a2hlbWth
QGZiLmNvbT46DQpIaSBXaW0sDQpXaGF0IGFyZSB0cnlpbmcgaGVyZSwgYWRkaW5nIGV4dHJhIGlw
bWkgc3VwcG9ydCBmb3IgeW91ciBvZW0gY29tbWFuZHM/IElQTUkgc3VwcG9ydCBpcyBhbHJlYWR5
IHRoZXJlIGluIHBob3NwaG9yLWltYWdlLiBQbGVhc2Ugc2VlIGlmICJpcG1pZCIgZGFlbW9uIGlz
IHJ1bm5pbmcuIFlvdSBjYW4gY2hlY2sgcGFja2FnZSBwaG9zcGhvci1pcG1pLWhvc3Qgd2hpY2gg
cHJvdmlkZXMgc3VwcG9ydCBmb3IgaXBtaSBkYWVtb24uDQoNClJlZ2FyZHMNCi1WaWpheQ0KDQrv
u79PbiAyLzE1LzE5LCAzOjIzIEFNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgV2ltIFZlcnZvb3Ju
IiA8b3BlbmJtYy1ib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxhYnMub3JnIG9u
IGJlaGFsZiBvZiB3dmVydm9vcm5AZWx0YW4uY29tPiB3cm90ZToNCg0KICAgIEhlbGxvLA0KDQog
ICAgV2UgaGF2ZSBhbiBleGlzdGluZyBBU1QyNDAwIGJhc2VkIGltcGxlbWVudGF0aW9uIGZvciBP
cGVuQk1DIDIuNi4wIGFuZCBhcmUgdHJ5aW5nIHRvIGFkZCBJUE1JIHN1cHBvcnQgdG8gaXQuDQoN
CiAgICBBdCB0aGlzIG1vbWVudCB3ZSBkb24ndCBoYXZlIGEgZ29vZCBzZXQgb2YgZG9jdW1lbnRh
dGlvbiBvbiB0aGUgaXBtaSBpbXBsZW1lbnRhdGlvbiBpbmNsdWRlZCBpbiBPcGVuQk1DLg0KDQog
ICAgQ2FuIGFueW9uZSBwb2ludCBtZSB0byB0aGlzIGRvY3VtZW50YXRpb24/IE9yIGlzIHRoZSBv
bmx5IHdheSB0byBkbyB0aGlzIHRvIGdvIG92ZXIgdGhlIHZhcmlvdXMgcGFja2FnZXM/DQoNCiAg
ICBCZXN0IHJlZ2FyZHMsDQoNCiAgICBXaW0gVmVydm9vcm4NCg0KDQo=

--_000_ca9f5aa5d0be44bbb7262dec846c60a0emailandroidcom_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRvciIgY29udGVu
dD0iTWljcm9zb2Z0IEV4Y2hhbmdlIFNlcnZlciI+DQo8IS0tIGNvbnZlcnRlZCBmcm9tIHRleHQg
LS0+PHN0eWxlPjwhLS0gLkVtYWlsUXVvdGUgeyBtYXJnaW4tbGVmdDogMXB0OyBwYWRkaW5nLWxl
ZnQ6IDRwdDsgYm9yZGVyLWxlZnQ6ICM4MDAwMDAgMnB4IHNvbGlkOyB9IC0tPjwvc3R5bGU+DQo8
L2hlYWQ+DQo8Ym9keT4NCjxkaXY+DQo8ZGl2IGRpcj0iYXV0byI+QXQgdGhpcyBwb2ludCBJJ20g
bm90IGxvb2tpbmcgZm9yIGFkZGl0aW9uYWwgT0VNIGNvbW1hbmRzLiZuYnNwOw0KPGRpdiBkaXI9
ImF1dG8iPjxicj4NCjwvZGl2Pg0KPGRpdiBkaXI9ImF1dG8iPk15IG1haW4gZ29hbCBpcyBqdXN0
IHRvIGFkZCBhbGwgc3VwcG9ydCByZXF1ZXN0IHRvIGVuYWJsZSBpbmJhbmQgaXBtaSB3aXRoIEtD
UyBpbnRlcmZhY2UuJm5ic3A7IFRoZSBtb3N0IGltcG9ydGFudCB0aGluZyBpcyB0aGF0IHRoZSBz
eXN0ZW0gaXMgY2FwYWJsZSB0byBwcm92aWRlIHRoZSBpbnZlbnRvcnkgYW5kIGV2ZW50bG9nIGlu
Zm9ybWF0aW9uIHRvIHRoZSBCTUMgZHVyaW5nIGJvb3QuPC9kaXY+DQo8ZGl2IGRpcj0iYXV0byI+
PGJyPg0KPC9kaXY+DQo8ZGl2IGRpcj0iYXV0byI+VGhlIGluZm9ybWF0aW9uIEkgYW0gbG9va2lu
ZyBmb3IgYXJlIGl0ZW1zIGxpa2UuIFdoaWNoIHNlcnZpY2VzIG5lZWQgdG8gYmUgaW5jbHVkZWQg
YW5kIHdoYXQgZG8gSSBuZWVkIHRvIGNvbmZpZ3VyZSB0byBtYWtlIGl0IHdvcmsuPC9kaXY+DQo8
ZGl2IGRpcj0iYXV0byI+PGJyPg0KPC9kaXY+DQo8ZGl2IGRpcj0iYXV0byI+QmVzdCByZWdhcmRz
LDwvZGl2Pg0KPGRpdiBkaXI9ImF1dG8iPjxicj4NCjwvZGl2Pg0KPGRpdiBkaXI9ImF1dG8iPldp
bSBWZXJ2b29ybjwvZGl2Pg0KPC9kaXY+DQo8ZGl2IGNsYXNzPSJ4X2dtYWlsX2V4dHJhIj48YnI+
DQo8ZGl2IGNsYXNzPSJ4X2dtYWlsX3F1b3RlIj5PcCAxNSBmZWIuIDIwMTkgOTozMSBwLm0uIHNj
aHJlZWYgVmlqYXkgS2hlbWthICZsdDt2aWpheWtoZW1rYUBmYi5jb20mZ3Q7OjxiciB0eXBlPSJh
dHRyaWJ1dGlvbiI+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9kaXY+DQo8Zm9udCBzaXplPSIyIj48c3Bh
biBzdHlsZT0iZm9udC1zaXplOjEwcHQ7Ij4NCjxkaXYgY2xhc3M9IlBsYWluVGV4dCI+SGkgV2lt
LDxicj4NCldoYXQgYXJlIHRyeWluZyBoZXJlLCBhZGRpbmcgZXh0cmEgaXBtaSBzdXBwb3J0IGZv
ciB5b3VyIG9lbSBjb21tYW5kcz8gSVBNSSBzdXBwb3J0IGlzIGFscmVhZHkgdGhlcmUgaW4gcGhv
c3Bob3ItaW1hZ2UuIFBsZWFzZSBzZWUgaWYgJnF1b3Q7aXBtaWQmcXVvdDsgZGFlbW9uIGlzIHJ1
bm5pbmcuIFlvdSBjYW4gY2hlY2sgcGFja2FnZSBwaG9zcGhvci1pcG1pLWhvc3Qgd2hpY2ggcHJv
dmlkZXMgc3VwcG9ydCBmb3IgaXBtaSBkYWVtb24uPGJyPg0KPGJyPg0KUmVnYXJkczxicj4NCi1W
aWpheTxicj4NCjxicj4NCu+7v09uIDIvMTUvMTksIDM6MjMgQU0sICZxdW90O29wZW5ibWMgb24g
YmVoYWxmIG9mIFdpbSBWZXJ2b29ybiZxdW90OyAmbHQ7b3BlbmJtYy1ib3VuY2VzJiM0Mzt2aWph
eWtoZW1rYT1mYi5jb21AbGlzdHMub3psYWJzLm9yZyBvbiBiZWhhbGYgb2Ygd3ZlcnZvb3JuQGVs
dGFuLmNvbSZndDsgd3JvdGU6PGJyPg0KPGJyPg0KJm5ic3A7Jm5ic3A7Jm5ic3A7IEhlbGxvLDxi
cj4NCiZuYnNwOyZuYnNwOyZuYnNwOyA8YnI+DQombmJzcDsmbmJzcDsmbmJzcDsgV2UgaGF2ZSBh
biBleGlzdGluZyBBU1QyNDAwIGJhc2VkIGltcGxlbWVudGF0aW9uIGZvciBPcGVuQk1DIDIuNi4w
IGFuZCBhcmUgdHJ5aW5nIHRvIGFkZCBJUE1JIHN1cHBvcnQgdG8gaXQuPGJyPg0KJm5ic3A7Jm5i
c3A7Jm5ic3A7IDxicj4NCiZuYnNwOyZuYnNwOyZuYnNwOyBBdCB0aGlzIG1vbWVudCB3ZSBkb24n
dCBoYXZlIGEgZ29vZCBzZXQgb2YgZG9jdW1lbnRhdGlvbiBvbiB0aGUgaXBtaSBpbXBsZW1lbnRh
dGlvbiBpbmNsdWRlZCBpbiBPcGVuQk1DLjxicj4NCiZuYnNwOyZuYnNwOyZuYnNwOyA8YnI+DQom
bmJzcDsmbmJzcDsmbmJzcDsgQ2FuIGFueW9uZSBwb2ludCBtZSB0byB0aGlzIGRvY3VtZW50YXRp
b24/IE9yIGlzIHRoZSBvbmx5IHdheSB0byBkbyB0aGlzIHRvIGdvIG92ZXIgdGhlIHZhcmlvdXMg
cGFja2FnZXM/PGJyPg0KJm5ic3A7Jm5ic3A7Jm5ic3A7IDxicj4NCiZuYnNwOyZuYnNwOyZuYnNw
OyBCZXN0IHJlZ2FyZHMsPGJyPg0KJm5ic3A7Jm5ic3A7Jm5ic3A7IDxicj4NCiZuYnNwOyZuYnNw
OyZuYnNwOyBXaW0gVmVydm9vcm48YnI+DQombmJzcDsmbmJzcDsmbmJzcDsgPGJyPg0KPGJyPg0K
PC9kaXY+DQo8L3NwYW4+PC9mb250Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_ca9f5aa5d0be44bbb7262dec846c60a0emailandroidcom_--
