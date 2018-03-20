Return-Path: <wvervoorn@eltan.com>
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=eltan.com
 (client-ip=213.75.39.8; helo=cpsmtpb-ews05.kpnxchange.com;
 envelope-from=wvervoorn@eltan.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=eltan.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="VfG8lBYf"; 
 dkim-atps=neutral
X-Greylist: delayed 794 seconds by postgrey-1.36 at bilbo;
 Tue, 20 Mar 2018 22:37:28 AEDT
Received: from cpsmtpb-ews05.kpnxchange.com (cpsmtpb-ews05.kpnxchange.com
 [213.75.39.8])
 by lists.ozlabs.org (Postfix) with ESMTP id 4059s451K2zF1T4
 for <openbmc@lists.ozlabs.org>; Tue, 20 Mar 2018 22:37:27 +1100 (AEDT)
Received: from cpsps-ews17.kpnxchange.com ([10.94.84.183]) by
 cpsmtpb-ews05.kpnxchange.com with Microsoft SMTPSVC(7.5.7601.17514); 
 Tue, 20 Mar 2018 12:23:59 +0100
X-Brand: 7Ljiz6bi2A==
X-KPN-SpamVerdict: e1=0;e2=;e3=0(e1=10;e3=10;e2=00);EVW:White;BM:Clean
 ;FinalVerdict:Clean
X-Brightmail-Tracker: H4sIAAAAAAAAC+NgFrrJLMWRWlGSWpSXmKPExsVyuJJZUNf/
 /YYog3mbv/BanGp5weLA6HF+xkLGAMYo1sy8pPyKBNaMjXeusRb8YamY/ryDvYHxJ3MXIy
 eHhIC6xJIvJxm7GLk4hASWMUrce3gBLMEsIC5x68l8JghbR2LB7k9sELa2xLKFr5lBGlgE
 Opklbr/byw7RvZNRYsrRVmYIZwOjxJu2A1DObkaJF4fPs4P0swloSPSsngM2S0TAUmLJg3
 YwW1jAS2Lft9msEPFAifkP/zNB2HoSV0/PBrNZBFQlTj07DmbzCjhLvFm2BuhwDg5GAVmJ
 ltfcEP8ISCzZcx7qN1GJl4//sULYyhJLu88yQrQKSpyc+YQFxBYSUJCYtmgZI0RNsMS3iV
 3sExjFZyGFwCykEJiFFAKzkIxawMiyilEiuaC4oFg3tbzY0FwvuyAPyNDLyU9OzNnECIyj
 q94azjsYb0+NvcUozXGASYgjLbG4pCCxuFiIJS8/L1UKqCQktChMqoFRM7LoFu+imqWBpz
 5Oqvm4VG5WYOWCM9PE3hSaC/V1O+x7uu9kRaXxh7+uSVKRC1jya6e4T95ac05hmrA5k7Nl
 s3vX5tpVLNe5Ts5Vv7XOhuHwvtf3U/XX3Jr5+o+GellKPWtGngp70Bnl2ijxTt2EBZdt2T
 iKZOceM/mo83Pyvnner1K2PF+nxFKckWioxVxUnAgARZA8Z2wCAAA=
X-CM-AcctID: kpn@feedback.cloudmark.com
Received: from CPSMTPM-CMT101.kpnxchange.com ([195.121.3.17]) by
 cpsps-ews17.kpnxchange.com with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 20 Mar 2018 12:23:59 +0100
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; d=kpnmail.nl; s=kpnmail01;
 c=relaxed/relaxed; t=1521545039;
 h=mime-version:date:message-id:subject:from:to:content-type;
 bh=o2aKuuR9SXypy1ob1gZu7l/cmlryuIv/0QaX5E93+JU=;
 b=VfG8lBYfa4e5o2TQ3vhU6vajm4khEDkhugHy0z8H0ORFQvZ+YifaBln7hVc9qWc5pcr1lbNG+gs
 htQwDhmF8GSbHW33ySw5gf1buE92EHU2EUwSQVGmCLiVNZvf7BrMHugGoU2nnr/4D4gnEOz6CQA+l
 qmYEEQmDslp8hz8gwZY=
Received: from Eltsrv03.Eltan.local ([84.85.114.86]) by
 CPSMTPM-CMT101.kpnxchange.com over TLS secured channel with Microsoft
 SMTPSVC(8.5.9600.16384); Tue, 20 Mar 2018 12:23:59 +0100
Received: from Eltsrv03.Eltan.local (192.168.100.3) by Eltsrv03.Eltan.local
 (192.168.100.3) with Microsoft SMTP Server (TLS) id 15.0.847.32; Tue, 20 Mar
 2018 12:23:52 +0100
Received: from Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8]) by
 Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8%12]) with mapi id
 15.00.0847.040; Tue, 20 Mar 2018 12:23:52 +0100
From: Wim Vervoorn <wvervoorn@eltan.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: can't access openbmc-boost-dbus when building openbmc for s2600wf
Thread-Topic: can't access openbmc-boost-dbus when building openbmc for s2600wf
Thread-Index: AdPAPOfRWU+eF0mXQfOdH9039C7NuQ==
Date: Tue, 20 Mar 2018 11:23:52 +0000
Message-ID: <89370cb4fa8e4235a9272035ddbb3263@Eltsrv03.Eltan.local>
Accept-Language: nl-NL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.100.108]
MIME-Version: 1.0
X-OriginalArrivalTime: 20 Mar 2018 11:23:59.0334 (UTC)
 FILETIME=[F1096860:01D3C03D]
X-RcptDomain: lists.ozlabs.org
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
X-List-Received-Date: Tue, 20 Mar 2018 11:37:31 -0000

Hello,

I am trying to build openbmc for the s2600wf board.

During the process I get the message that the "boost-dbus" module can't be =
read.

The issue is due to the url referred to in the  openbmc/bmcweb/.gitmodules

[submodule "boost-dbus"]
	path =3D boost-dbus
	url =3D ssh://git-amr-2.devtools.intel.com:29418/openbmc-boost-dbus

The message I get is : "ssh: Could not resolve hostname git-amr-2.devtools.=
intel.com: Name or service not known"

Is this a matter of a server that is down? It there an alternate location I=
 can use for this module

Thanks for helping me out.

Best regards,

Wim Vervoorn
