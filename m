Return-Path: <wvervoorn@eltan.com>
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=eltan.com
 (client-ip=213.75.39.15; helo=cpsmtpb-ews10.kpnxchange.com;
 envelope-from=wvervoorn@eltan.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=eltan.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="mf6KZc5W"; 
 dkim-atps=neutral
X-Greylist: delayed 801 seconds by postgrey-1.36 at bilbo;
 Fri, 15 Feb 2019 03:35:20 AEDT
Received: from cpsmtpb-ews10.kpnxchange.com (cpsmtpb-ews10.kpnxchange.com
 [213.75.39.15])
 by lists.ozlabs.org (Postfix) with ESMTP id 440hp03FSbzDqcD
 for <openbmc@lists.ozlabs.org>; Fri, 15 Feb 2019 03:35:18 +1100 (AEDT)
Received: from cpsps-ews13.kpnxchange.com ([10.94.84.180]) by
 cpsmtpb-ews10.kpnxchange.com with Microsoft SMTPSVC(7.5.7601.17514); 
 Thu, 14 Feb 2019 17:21:51 +0100
X-Brand: /q/rzKX13g==
X-KPN-SpamVerdict: e1=0;e2=0;e3=0;e4=(e4=10;e1=10;e2=11;e3=10);EVW:Whi
 te;BM:NotScanned;FinalVerdict:Clean
X-CMAE-Analysis: v=2.3 cv=GcnGYjfL c=1 sm=1 tr=0
 a=sfk9uMsoq7e5/NfZ3OK45Q==:117 a=+94oq0dzjs5YbdIDA+8OCg==:17
 a=eIHzyqS2sMcA:10 a=kj9zAlcOel0A:10 a=xqWC_Br6kY4A:10
 a=CFTnQlWoA9kA:10 a=wUFvI-CCSdcnM4vRU30A:9 a=CjuIK1q_8ugA:10
X-CM-AcctID: kpn@feedback.cloudmark.com
Received: from CPSMTPM-CMT108.kpnxchange.com ([195.121.3.24]) by
 cpsps-ews13.kpnxchange.com with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 14 Feb 2019 17:21:51 +0100
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; d=kpnmail.nl; s=kpnmail01;
 c=relaxed/relaxed; t=1550161311;
 h=mime-version:date:message-id:subject:from:to:content-type;
 bh=8o7WCXnIN9bhVbMyW4WSKtFO/E6AJeZ71xkbsdUyNBI=;
 b=mf6KZc5WQ1VEq5R9+RQOpQ98lLqWnEq8nUWoe2/eCbp0Y83htE5oM9yj8jBVObQvoVdyw6cE/Zf
 LpGcWsLryRB2UpmUfz/g5pP7du2liig2uTheXYVGXkFwY/CMaoNToRJWqzLLx/njgl+870udYlfqj
 cQGENE2SOve0WWC3YXo=
Received: from Eltsrv03.Eltan.local ([84.85.114.86]) by
 CPSMTPM-CMT108.kpnxchange.com over TLS secured channel with Microsoft
 SMTPSVC(8.5.9600.16384); Thu, 14 Feb 2019 17:21:51 +0100
Received: from Eltsrv03.Eltan.local (192.168.100.3) by Eltsrv03.Eltan.local
 (192.168.100.3) with Microsoft SMTP Server (TLS) id 15.0.847.32; Thu, 14 Feb
 2019 17:21:11 +0100
Received: from Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8]) by
 Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8%12]) with mapi id
 15.00.0847.040; Thu, 14 Feb 2019 17:21:11 +0100
From: Wim Vervoorn <wvervoorn@eltan.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Building intel s2600wf image
Thread-Topic: Building intel s2600wf image
Thread-Index: AdTEgOxruXMkKJM/Q0SIL26ipoAf6Q==
Date: Thu, 14 Feb 2019 16:21:10 +0000
Message-ID: <5beefafbdca24738a72f243e667823fe@Eltsrv03.Eltan.local>
Accept-Language: nl-NL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.100.108]
MIME-Version: 1.0
X-OriginalArrivalTime: 14 Feb 2019 16:21:51.0378 (UTC)
 FILETIME=[64562720:01D4C481]
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
X-List-Received-Date: Thu, 14 Feb 2019 16:35:23 -0000

Hello,

We are trying to build the Intel s2600wf image using the latest OpenBMC tre=
e. If we do that we are running into build errors.

Before digging into this can you tell me which commit of the tree can be us=
ed to build an image for  this device without errors. This allows us to hav=
e a stable version for reference.

Best Regards,

Wim Vervoorn=20
Eltan B.V.
