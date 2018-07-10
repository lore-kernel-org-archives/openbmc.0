Return-Path: <joseph-reynolds@charter.net>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=charter.net
 (client-ip=68.114.190.40; helo=que003-public.msg.strl.va.charter.net;
 envelope-from=joseph-reynolds@charter.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=charter.net
X-Greylist: delayed 833 seconds by postgrey-1.36 at bilbo;
 Tue, 10 Jul 2018 12:34:06 AEST
Received: from que003-public.msg.strl.va.charter.net
 (que003-public.msg.strl.va.charter.net [68.114.190.40])
 by lists.ozlabs.org (Postfix) with ESMTP id 41PmVQ4v0ZzDr0d
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jul 2018 12:34:05 +1000 (AEST)
Received: from impout002 ([68.114.189.17]) by mtaout002.msg.strl.va.charter.net
 (InterMail vM.9.00.023.01 201-2473-194) with ESMTP
 id <20180710022007.YART7360.mtaout002.msg.strl.va.charter.net@impout002>
 for <openbmc@lists.ozlabs.org>; Mon, 9 Jul 2018 21:20:07 -0500
Received: from [192.168.2.14] ([97.86.254.207]) by impout002 with charter.net
 id 8qL61y0084VFKzV01qL6rE; Mon, 09 Jul 2018 21:20:06 -0500
X-Authority-Analysis: v=2.2 cv=C6eZ8UH+ c=1 sm=1 tr=0
 a=TxbYGM+zWkYih0pDanbSSw==:117 a=TxbYGM+zWkYih0pDanbSSw==:17
 a=x7bEGLp0ZPQA:10 a=r77TgQKjGQsHNAKrUKIA:9 a=dpRSjrXKAAAA:8 a=B6KMzFptAAAA:20
 a=pidFw_JJ1cJ0Pb_JJu8A:9 a=QEXdDO2ut3YA:10 a=-FEs8UIgK8oA:10
 a=NWVoK91CQyQA:10 a=xmQ3RezXRdh6fXheQSoA:9 a=_W_S_7VecoQA:10
 a=xkwab4zIHtOjTkBAMNFX:22
X-Auth-id: am9zZXBoLXJleW5vbGRzQGNoYXJ0ZXIubmV0
To: openbmc@lists.ozlabs.org
From: Joseph Reynolds <joseph-reynolds@charter.net>
Subject: OpenBMC security workgroup status
Message-ID: <56a8460a-543e-fe0f-9c1b-881f088f39c7@charter.net>
Date: Mon, 9 Jul 2018 21:20:03 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------0A30C53C14D82143C922D1A1"
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
X-List-Received-Date: Tue, 10 Jul 2018 02:34:08 -0000

This is a multi-part message in MIME format.
--------------0A30C53C14D82143C922D1A1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Here is the OpenBMC security work group status.

The OpenBMC security work has been partitioned into four areas: 
hardware, firmware (Linux, phosphor, etc.), OpenBMC development 
activity, and downstream development.  Reviews are out for three areas; 
see https://gerrit.openbmc-project.xyz/#/c/11120/ and 11164.  Work to 
sketch out firmware security topics is beginning.  We are also beginning 
to look at topics such as release planning and how to handle security 
flaws.  For more details, see the group’s agenda and minutes at 
https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI.

- Joseph Reynolds

--------------0A30C53C14D82143C922D1A1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><span class="mx_MTextBody mx_EventTile_content"><span
          class="mx_EventTile_body" dir="auto">Here is the OpenBMC
          security work group status.</span></span></p>
    <p><span class="mx_MTextBody mx_EventTile_content"><span
          class="mx_EventTile_body" dir="auto">The OpenBMC security work
          has been partitioned into four areas: hardware, firmware
          (Linux, phosphor, etc.), OpenBMC development activity, and
          downstream development.  Reviews are out for three areas; see
          <a href="https://gerrit.openbmc-project.xyz/#/c/11120/"
            class="linkified" target="_blank" rel="noopener">https://gerrit.openbmc-project.xyz/#/c/11120/</a>
          and 11164.  Work to sketch out firmware security topics is
          beginning.  We are also beginning to look at topics such as
          release planning and how to handle security flaws.  For more
          details, see the group’s agenda and minutes at <a
href="https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI"
            class="linkified" target="_blank" rel="noopener">https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI</a>.</span></span></p>
    <div class="moz-signature">- Joseph Reynolds</div>
  </body>
</html>

--------------0A30C53C14D82143C922D1A1--
