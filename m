Return-Path: <joseph-reynolds@charter.net>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=charter.net
 (client-ip=68.114.190.31; helo=mtaout006-public.msg.strl.va.charter.net;
 envelope-from=joseph-reynolds@charter.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=charter.net
Received: from mtaout006-public.msg.strl.va.charter.net
 (mtaout006-public.msg.strl.va.charter.net [68.114.190.31])
 by lists.ozlabs.org (Postfix) with ESMTP id 40xnYs3YJ0zDrbW
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jun 2018 11:58:55 +1000 (AEST)
Received: from impout006 ([68.114.189.21]) by mtaout006.msg.strl.va.charter.net
 (InterMail vM.9.00.023.01 201-2473-194) with ESMTP
 id <20180601015853.JIKB7358.mtaout006.msg.strl.va.charter.net@impout006>
 for <openbmc@lists.ozlabs.org>; Thu, 31 May 2018 20:58:53 -0500
Received: from [192.168.2.15] ([97.86.254.207]) by impout006 with charter.net
 id tDys1x0094VFKzV01DytU8; Thu, 31 May 2018 20:58:53 -0500
X-Authority-Analysis: v=2.2 cv=TP81cxta c=1 sm=1 tr=0
 a=TxbYGM+zWkYih0pDanbSSw==:117 a=TxbYGM+zWkYih0pDanbSSw==:17
 a=x7bEGLp0ZPQA:10 a=r77TgQKjGQsHNAKrUKIA:9 a=voM4FWlXAAAA:8 a=VnNF1IyMAAAA:8
 a=1XWaLZrsAAAA:8 a=tFCOJjRmDwOHEBbo2RsA:9 a=QEXdDO2ut3YA:10
 a=MmkeA0CdJi5wE5q-hHQA:9 a=uNJ4cue0cMR-9zXK:21 a=_W_S_7VecoQA:10
 a=IC2XNlieTeVoXbcui8wp:22
X-Auth-id: am9zZXBoLXJleW5vbGRzQGNoYXJ0ZXIubmV0
Subject: OpenBMC Security Working Group Kick Off - from a hostile host
To: openbmc@lists.ozlabs.org
References: <mailman.378.1527772501.18429.openbmc@lists.ozlabs.org>
From: Joseph Reynolds <joseph-reynolds@charter.net>
Message-ID: <40f49d16-f6fc-97ed-8184-7159f7e4d0e8@charter.net>
Date: Thu, 31 May 2018 20:58:33 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <mailman.378.1527772501.18429.openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative;
 boundary="------------4E41ADC287B056075E17CCDF"
Content-Language: en-US
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
X-List-Received-Date: Fri, 01 Jun 2018 01:58:58 -0000

This is a multi-part message in MIME format.
--------------4E41ADC287B056075E17CCDF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/31/2018 8:15 AM, openbmc-request@lists.ozlabs.org wrote:
> Message: 1
> Date: Thu, 31 May 2018 18:38:23 +1000
> From: Stewart Smith<stewart@linux.ibm.com>
> To: Nancy Yuen<yuenn@google.com>, OpenBMC Maillist
> 	<openbmc@lists.ozlabs.org>
> Subject: Re: OpenBMC Security Working Group Kick Off
> Message-ID:<87efhs43uo.fsf@linux.vnet.ibm.com>
> Content-Type: text/plain
>
> Nancy Yuen<yuenn@google.com>  writes:
>> The OpenBMC Security Work Group kick off meeting is scheduled for Thurs May
>> 31, 9AM PDT.  This first meeting is by invite only.  Please email me if you
>> are interested in participating in this working group.
> Would topics like "security of the BMC from a hostile host" be part of
> this?
>
> A design of OpenPOWER systems is that the BMC and the Host don't have to
> trust each other, and this should extend to a host that's hostile
> towards the BMC.

Yes!  The BMC security boundary ends at the pins that connect to the 
host, so that is treated an attack surface.  I may have been a bit fuzzy 
on this when I sketched out the initial security docs...so I'll update 
the OpenBMC security docs to talk about risks from host ipmi and mbox 
and explain the security risks, then grab an expert to explore further.

- Joseph
> I'd be surprised if we didn't find bugs in both mboxd and host ipmi if
> we started fuzzing those interfaces.
>
> -- Stewart Smith OPAL Architect, IBM.


--------------4E41ADC287B056075E17CCDF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 5/31/2018 8:15 AM,
      <a class="moz-txt-link-abbreviated" href="mailto:openbmc-request@lists.ozlabs.org">openbmc-request@lists.ozlabs.org</a> wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:mailman.378.1527772501.18429.openbmc@lists.ozlabs.org">
      <pre wrap="">Message: 1
Date: Thu, 31 May 2018 18:38:23 +1000
From: Stewart Smith <a class="moz-txt-link-rfc2396E" href="mailto:stewart@linux.ibm.com" moz-do-not-send="true">&lt;stewart@linux.ibm.com&gt;</a>
To: Nancy Yuen <a class="moz-txt-link-rfc2396E" href="mailto:yuenn@google.com" moz-do-not-send="true">&lt;yuenn@google.com&gt;</a>, OpenBMC Maillist
	<a class="moz-txt-link-rfc2396E" href="mailto:openbmc@lists.ozlabs.org" moz-do-not-send="true">&lt;openbmc@lists.ozlabs.org&gt;</a>
Subject: Re: OpenBMC Security Working Group Kick Off
Message-ID: <a class="moz-txt-link-rfc2396E" href="mailto:87efhs43uo.fsf@linux.vnet.ibm.com" moz-do-not-send="true">&lt;87efhs43uo.fsf@linux.vnet.ibm.com&gt;</a>
Content-Type: text/plain

Nancy Yuen <a class="moz-txt-link-rfc2396E" href="mailto:yuenn@google.com" moz-do-not-send="true">&lt;yuenn@google.com&gt;</a> writes:
</pre>
      <blockquote type="cite" style="color: #000000;">
        <pre wrap="">The OpenBMC Security Work Group kick off meeting is scheduled for Thurs May
31, 9AM PDT.  This first meeting is by invite only.  Please email me if you
are interested in participating in this working group.
</pre>
      </blockquote>
      <pre wrap="">Would topics like "security of the BMC from a hostile host" be part of
this?

A design of OpenPOWER systems is that the BMC and the Host don't have to
trust each other, and this should extend to a host that's hostile
towards the BMC.
</pre>
    </blockquote>
    <p>Yes!  The BMC security boundary ends at the pins that connect to
      the host, so that is treated an attack surface.  I may have been a
      bit fuzzy on this when I sketched out the initial security
      docs...so I'll update the OpenBMC security docs to talk about
      risks from host ipmi and mbox and explain the security risks, then
      grab an expert to explore further.<br>
    </p>
    - Joseph<br>
    <blockquote type="cite"
      cite="mid:mailman.378.1527772501.18429.openbmc@lists.ozlabs.org">
      <pre wrap="">
I'd be surprised if we didn't find bugs in both mboxd and host ipmi if
we started fuzzing those interfaces.

<div class="moz-txt-sig">-- 
Stewart Smith
OPAL Architect, IBM.</div></pre>
    </blockquote>
    <br>
  </body>
</html>

--------------4E41ADC287B056075E17CCDF--
