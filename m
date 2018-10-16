Return-Path: <joseph-reynolds@charter.net>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=charter.net
 (client-ip=68.114.190.31; helo=mtaout006-public.msg.strl.va.charter.net;
 envelope-from=joseph-reynolds@charter.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=charter.net
Received: from mtaout006-public.msg.strl.va.charter.net
 (mtaout006-public.msg.strl.va.charter.net [68.114.190.31])
 by lists.ozlabs.org (Postfix) with ESMTP id 42Yzy13HKpzF3Vt
 for <openbmc@lists.ozlabs.org>; Tue, 16 Oct 2018 13:38:16 +1100 (AEDT)
Received: from impout002 ([68.114.189.17]) by mtaout006.msg.strl.va.charter.net
 (InterMail vM.9.00.023.01 201-2473-194) with ESMTP
 id <20181016023813.UCIP7358.mtaout006.msg.strl.va.charter.net@impout002>
 for <openbmc@lists.ozlabs.org>; Mon, 15 Oct 2018 21:38:13 -0500
Received: from [192.168.2.18] ([97.86.254.207]) by impout002 with charter.net
 id o2eC1y0094VFKzV012eDXB; Mon, 15 Oct 2018 21:38:13 -0500
X-Authority-Analysis: v=2.2 cv=C6eZ8UH+ c=1 sm=1 tr=0
 a=TxbYGM+zWkYih0pDanbSSw==:117 a=TxbYGM+zWkYih0pDanbSSw==:17
 a=IkcTkHD0fZMA:10 a=voM4FWlXAAAA:8 a=NEAV23lmAAAA:8 a=8pif782wAAAA:8
 a=HlTi-G0HQGvn4gcdvLIA:9 a=QEXdDO2ut3YA:10 a=IC2XNlieTeVoXbcui8wp:22
X-Auth-id: am9zZXBoLXJleW5vbGRzQGNoYXJ0ZXIubmV0
Subject: Better design discussions
To: openbmc@lists.ozlabs.org
References: <mailman.14298.1539639873.866.openbmc@lists.ozlabs.org>
From: Joseph Reynolds <joseph-reynolds@charter.net>
Message-ID: <8cc3b2a5-5fdc-e7a6-fc11-3229c3010396@charter.net>
Date: Mon, 15 Oct 2018 21:37:59 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <mailman.14298.1539639873.866.openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Tue, 16 Oct 2018 02:38:18 -0000

On 10/15/2018 4:44 PM, openbmc-request@lists.ozlabs.org wrote:
> Send openbmc mailing list submissions to
> 	openbmc@lists.ozlabs.org

This is a summary of an OpenBMC Community Call discussion held on 
2018-Oct-15.  I gave my advice for how to make our design discussions 
more approachable and easier to understand.  The advice is consistent 
with ideas discussed by the release planning workgroup and the testing 
workgroup.  The main idea is to use the new design template: 
https://github.com/openbmc/docs/blob/master/designs/design-template.md, 
specifically:
- record the problem that prompted you to create the design
- walk through functional scenarios in your design overview

The problems I am trying to solve include:
- It can be difficult to understand the context each design, that is, 
how it fits into the larger solution.
- It can be difficult to understand the value of each design, that is, 
what problem it solves.
- It can be difficult to understand the function of each design, that 
is, how to use it to solve a problem.

Details:

Why take time to document requirements and scenarios?
- Writing the requirements and walking through scenarios will sharpen 
your thinking about what problem you are trying to solve and how you 
plan solve it.
- You only need to explain your requirements once, and you won't have to 
repeat yourself.
- You'll be helping the uninitiated to understand your technical area.
- Your designs will be more approachable and easier to understand.
- You'll get better reviews which will give you a better design.
- Scenarios engage the reader and help explore your design.
- You'll learn how better requirements leads to better design, and how 
that leads to better code.

What exactly am I calling for?
- Requirements: Before you create new design, ask yourself what problem 
you are trying to solve, then write down the answer.  See the design 
template for ideas.
- Scenarios: When you have a design, walk through a few high-level 
scenarios, then write them down.  See 
https://en.wikipedia.org/wiki/Scenario_(computing).
- Collaborate: Be prepared to answer questions about the problem you are 
proposing to solve.  Also be prepared to explain how to use your design 
to solve the problem.

That's the only change I am calling for.

I also presented a negative scenario intended to illustrate the 
consequences of not having a good design process.  In this scenario, 
attackers dump bad designs onto the mailing list, then push buggy code 
into gerrit, and +1 their reviews.  I believe a good defense against 
this (and more subtle bugs) is a development community that creates 
strong links between requirements, design, and code.

Thank you,
- Joseph
