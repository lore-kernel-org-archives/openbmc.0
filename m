Return-Path: <prvs=6002e67ace=tfang@fb.com>
X-Greylist: delayed 874 seconds by postgrey-1.35 at bilbo;
 Thu, 14 Jul 2016 02:59:07 AEST
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b=WKnXYlWb; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rqQ633YYvzDqFq
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jul 2016 02:59:06 +1000 (AEST)
Received: from pps.filterd (m0044008.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u6DGfUO3016037; Wed, 13 Jul 2016 09:44:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fb.com;
 h=subject : to : references
 : cc : from : message-id : date : mime-version : in-reply-to :
 content-type; s=facebook; bh=+30oyvoIW26FS3qFIiCjIuq3Z2/v7S3nmJuHakm5n+c=;
 b=WKnXYlWbsVrgPYvob34DSC/StIPzL3XpM+lvNBfRpodJfpHaB+Gu3xfwb+SeuIKbLNWe
 ZKJz11K21byxNKBtHj5uEMV8Uy4A1h3GXDzQH3dZT7oW35lLv55RNdQ98dAkslbzi8XQ
 piUcEwgBs9IXAlMjqNZnWgwE8nW6vSf7iNQ= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 245kkpjmk8-6
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 13 Jul 2016 09:44:26 -0700
Received: from [IPv6:2620:10d:c082:1055:f9a3:c3f:9519:3d8f] (192.168.52.123)
 by mail.thefacebook.com (192.168.16.16) with Microsoft SMTP Server (TLS) id
 14.3.294.0; Wed, 13 Jul 2016 09:44:16 -0700
Subject: Re: OpenBMC port to AST2400 on Piestewa Peak CRB?
To: Patrick Williams <patrick@stwcx.xyz>,
 =?UTF-8?Q?David_M=c3=bcller_=28ELSOFT_AG=29?= <d.mueller@elsoft.ch>
References: <57863637.3090405@elsoft.ch>
 <20160713162732.GB12735@asimov.austin.ibm.com>
CC: <openbmc@lists.ozlabs.org>, Teddy Reed <teddy@prosauce.org>
From: Tian Fang <tfang@fb.com>
Message-ID: <57866FE0.3030300@fb.com>
Date: Wed, 13 Jul 2016 09:44:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <20160713162732.GB12735@asimov.austin.ibm.com>
Content-Type: multipart/alternative;
 boundary="------------070903000707080908090101"
X-Originating-IP: [192.168.52.123]
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-07-13_08:, , signatures=0
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
X-List-Received-Date: Wed, 13 Jul 2016 16:59:08 -0000

--------------070903000707080908090101
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Dave,

Facebook has been developing OpenBMC for several Intel host CPU boards 
using AST2400. But not for Piestewa Peak Customer Reference board. As 
Patrick mentioned, "The AST2400 itself is
host-processor agnostic, so it probably wouldn't be much trouble to get 
it running on that board."

Facebook OpenBMC repo is at http://github.com/facebook/openbmc. We are 
working with IBM team to have common Linux kernel and u-boot.

Thx,
Tian

On 07/13/2016 09:27 AM, Patrick Williams wrote:
> Hi Dave,
>
> On Wed, Jul 13, 2016 at 02:38:15PM +0200, David Müller (ELSOFT AG) wrote:
>> Hello
>>
>> Does anybody have plans to port or have already ported OpenBMC to the
>> AST2400 BMC used on the Intel Piestewa Peak Customer Reference Board?
>>
>> Dave
>>
> Currently, the code tree at http://github.com/openbmc/openbmc only
> supports full functionality on Power8 systems.  The AST2400 itself is
> host-processor agnostic, so it probably wouldn't be much trouble to get
> it running on that board.  It would be the userspace apps that interact
> with the Host that would need work.
>
> Facebook has a different code stack that does support Intel processors.
> I do not know how close any of their systems would be to this reference
> board.
>
> We are wanting to work with anyone who might be interested in extending
> our code-base to support non-Power architectures, but it just isn't my
> team's focus.  We have been discussing with Facebook on how to get parts
> of the code stack common between our two efforts.  Our main areas of
> focus now have been on Linux kernel and u-boot support.
>
> Cc'd Teddy @ Facebook so he can forward this around over there.
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc


--------------070903000707080908090101
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Hi Dave,<br>
    <br>
    Facebook has been developing OpenBMC for several Intel host CPU
    boards using AST2400. But not for Piestewa Peak Customer Reference
    board. As Patrick mentioned, "The AST2400 itself is<br>
    host-processor agnostic, so it probably wouldn't be much trouble to
    get it running on that board."<br>
    <br>
    Facebook OpenBMC repo is at <a class="moz-txt-link-freetext" href="http://github.com/facebook/openbmc">http://github.com/facebook/openbmc</a>. We
    are working with IBM team to have common Linux kernel and u-boot.<br>
    <br>
    Thx,<br>
    Tian<br>
    <br>
    <div class="moz-cite-prefix">On 07/13/2016 09:27 AM, Patrick
      Williams wrote:<br>
    </div>
    <blockquote cite="mid:20160713162732.GB12735@asimov.austin.ibm.com"
      type="cite">
      <pre wrap="">Hi Dave,

On Wed, Jul 13, 2016 at 02:38:15PM +0200, David Müller (ELSOFT AG) wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">Hello

Does anybody have plans to port or have already ported OpenBMC to the
AST2400 BMC used on the Intel Piestewa Peak Customer Reference Board?

Dave

</pre>
      </blockquote>
      <pre wrap="">
Currently, the code tree at <a class="moz-txt-link-freetext" href="http://github.com/openbmc/openbmc">http://github.com/openbmc/openbmc</a> only
supports full functionality on Power8 systems.  The AST2400 itself is
host-processor agnostic, so it probably wouldn't be much trouble to get
it running on that board.  It would be the userspace apps that interact
with the Host that would need work.

Facebook has a different code stack that does support Intel processors.
I do not know how close any of their systems would be to this reference
board.

We are wanting to work with anyone who might be interested in extending
our code-base to support non-Power architectures, but it just isn't my
team's focus.  We have been discussing with Facebook on how to get parts
of the code stack common between our two efforts.  Our main areas of
focus now have been on Linux kernel and u-boot support.

Cc'd Teddy @ Facebook so he can forward this around over there.
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
openbmc mailing list
<a class="moz-txt-link-abbreviated" href="mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a>
<a class="moz-txt-link-freetext" href="https://lists.ozlabs.org/listinfo/openbmc">https://lists.ozlabs.org/listinfo/openbmc</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------070903000707080908090101--
