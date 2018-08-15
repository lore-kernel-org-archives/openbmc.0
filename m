Return-Path: <joseph-reynolds@charter.net>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=charter.net
 (client-ip=68.114.190.30; helo=mtaout005-public.msg.strl.va.charter.net;
 envelope-from=joseph-reynolds@charter.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=charter.net
Received: from mtaout005-public.msg.strl.va.charter.net
 (mtaout005-public.msg.strl.va.charter.net [68.114.190.30])
 by lists.ozlabs.org (Postfix) with ESMTP id 41qsGL4VGgzF1RN
 for <openbmc@lists.ozlabs.org>; Wed, 15 Aug 2018 11:25:13 +1000 (AEST)
Received: from impout004 ([68.114.189.19]) by mtaout005.msg.strl.va.charter.net
 (InterMail vM.9.00.023.01 201-2473-194) with ESMTP
 id <20180815012511.RNRT7356.mtaout005.msg.strl.va.charter.net@impout004>
 for <openbmc@lists.ozlabs.org>; Tue, 14 Aug 2018 20:25:11 -0500
Received: from [192.168.2.7] ([97.86.254.207]) by impout004 with charter.net
 id PDRB1y0054VFKzV01DRBLS; Tue, 14 Aug 2018 20:25:11 -0500
X-Authority-Analysis: v=2.2 cv=Cat43Pjl c=1 sm=1 tr=0
 a=TxbYGM+zWkYih0pDanbSSw==:117 a=TxbYGM+zWkYih0pDanbSSw==:17
 a=IkcTkHD0fZMA:10 a=x7bEGLp0ZPQA:10 a=NEAV23lmAAAA:8 a=SgL38s6MKrinSGu_DWQA:9
 a=QEXdDO2ut3YA:10 a=1urcsAcQ4Z0A:10 a=VlZU0XKO32wA:10
X-Auth-id: am9zZXBoLXJleW5vbGRzQGNoYXJ0ZXIubmV0
From: Joseph Reynolds <joseph-reynolds@charter.net>
Subject: Security Working Group - Wednesday meeting
To: openbmc@lists.ozlabs.org
Message-ID: <fe938a67-e582-be66-abdd-ea9be4f51fd0@charter.net>
Date: Tue, 14 Aug 2018 20:25:05 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Aug 2018 01:25:15 -0000

The OpenBMC Security Working Group is meeting this Wednesday at noon 
CDT,  10am PDT.  See the wiki for access and agenda: 
https://github.com/openbmc/openbmc/wiki/Security-working-group

Topics are light the week:
- Test run of the vulnerability reporting process, see 
https://github.com/openbmc/openbmc/issues/3359.
