Return-Path: <joseph-reynolds@charter.net>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=charter.net
 (client-ip=68.114.190.27; helo=mtaout002-public.msg.strl.va.charter.net;
 envelope-from=joseph-reynolds@charter.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=charter.net
Received: from mtaout002-public.msg.strl.va.charter.net
 (mtaout002-public.msg.strl.va.charter.net [68.114.190.27])
 by lists.ozlabs.org (Postfix) with ESMTP id 42fJ8t28KCzDrq6
 for <openbmc@lists.ozlabs.org>; Tue, 23 Oct 2018 14:02:36 +1100 (AEDT)
Received: from impout006 ([68.114.189.21]) by mtaout002.msg.strl.va.charter.net
 (InterMail vM.9.00.023.01 201-2473-194) with ESMTP
 id <20181023030232.TGMY7360.mtaout002.msg.strl.va.charter.net@impout006>
 for <openbmc@lists.ozlabs.org>; Mon, 22 Oct 2018 22:02:32 -0500
Received: from [192.168.2.6] ([97.86.254.207]) by impout006 with charter.net
 id qr2X1y0014VFKzV01r2YF1; Mon, 22 Oct 2018 22:02:32 -0500
X-Authority-Analysis: v=2.2 cv=HdZkdmM8 c=1 sm=1 tr=0
 a=TxbYGM+zWkYih0pDanbSSw==:117 a=TxbYGM+zWkYih0pDanbSSw==:17
 a=IkcTkHD0fZMA:10 a=NEAV23lmAAAA:8 a=64PtjVyTAAAA:8 a=ingqq-7WHNl5QUGhAZEA:9
 a=QEXdDO2ut3YA:10 a=RJyAB-wVv_-pkjQ8D6MA:22
X-Auth-id: am9zZXBoLXJleW5vbGRzQGNoYXJ0ZXIubmV0
Subject: OpenBMC Security Advisory - An ipmid buffer overflow can lead to
 privilege escalation and denial of service
To: openbmc@lists.ozlabs.org
References: <mailman.20189.1540247080.866.openbmc@lists.ozlabs.org>
From: Joseph Reynolds <joseph-reynolds@charter.net>
Message-ID: <2230834f-fd7d-61b6-5c58-05cd15fab1e2@charter.net>
Date: Mon, 22 Oct 2018 22:02:28 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <mailman.20189.1540247080.866.openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
X-List-Received-Date: Tue, 23 Oct 2018 03:02:39 -0000

I posted the following in https://github.com/openbmc/openbmc/issues/3415:

>   Buffer overflows were discovered in OpenBMC's IPMI Host implementation which can lead to memory corruption which can then lead to privilege escalation (running arbitrary commands as the root user), and to denial of service (by crashing the ipmid daemon).
>
> The CVSS score for these vulnerabilities is "8.2 High", with temporal score "6.9 Medium", with the following notes:
> https://www.first.org/cvss/calculator/3.0#CVSS:3.0/AV:L/AC:L/PR:H/UI:N/S:C/C:H/I:H/A:H/E:U/RC:U
>
>      AV: the attack is launched from the host connection
>      AC: no special circumstances are needed
>      PR: the attacker must already own the host
>      UI: n/a
>      S: changed, because ipmid can run commands as root
>      C/I/A: the BMC is totally compromised
>      E: unproven
>      RC: unknown, because there is no known exploit
>
> The fixes are in the https://github.com/openbmc/phosphor-host-ipmid source code repository as three git commits ending with git commit ID edb8bb069b5a5406dd06a6ef38251372ea988f5c.
>
> For more information, see OpenBMC contact information at https://github.com/openbmc/openbmc.
>
> Credit for finding these problems: Jenna Kallaher, Google Security Team
