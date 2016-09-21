Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sfTJq3gqYzDshZ
 for <openbmc@lists.ozlabs.org>; Thu, 22 Sep 2016 04:52:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Bzuwyyzp; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id w11so4508257oia.0
 for <openbmc@lists.ozlabs.org>; Wed, 21 Sep 2016 11:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=xnnTiCv9MkQ0cCqmdcdU7HD2V+dRJHkC+iedZpvb0WU=;
 b=Bzuwyyzp/VkAQly1ChXOJZNosyIfaixSV71AUnH+nmEP/mdFnZEAp9QrYb34TzrjTi
 yO2q0So4CeaWquNUTHypK+M3B/utdWq9+S3QouqO3rsltoXCLBpJUVGOAIGxcHA6SqKf
 lCL6ZqR89RRQUgpQEa9nlA3JPI07kFdy24pVvChaIMzGtDMIZVoTukoVISZlAT1qRk1T
 TAmtSun6IlebhomyVCPhGrfUVLdMB4t/bVLrr4pTlT12s3iKxSRaTO/GNaze6EtLtFz/
 /U4pq4Z2m0WxwwD5XwZyg1C8DhL+mE+y1lHIbYbFAvOKOTSu5MzGCXZUoc0MvL5nRjzy
 0Kxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=xnnTiCv9MkQ0cCqmdcdU7HD2V+dRJHkC+iedZpvb0WU=;
 b=Gvy4DJGFePxftTFFLbjZTFmPSSH0cDIGbQynZ4OvoozO65MQVUf9Qb5Qi8dFergoFp
 PT4R6rgc3x+xqq+SAxiXC1LgKJDBImLzHMgfK8m6K7sWlvJFmsRMUeoDx4Nyt06mVgBW
 3fW26Hur/9hy6rPCpfhYQCj3j9mjbm/t/9o23Jt0lFOlKsdX4pwf9RM4ptmOlTgj4ad5
 IMNVHwXpiQy0Jz1GXFpdPWbh1Vrhq8yuGsvHaOH/oDGhvn/UGAVv1O5s+sldUECWuvAW
 f00xCc+Nq+fiV2+zQChT9bFnokHe2S656aYsh+3O7OsJe7o2SqsKgjZXQyeQ1IWSl8I/
 CduQ==
X-Gm-Message-State: AE9vXwODBbM6Qj88tZ6BDB1o67U8lXKP52WTi0CCcCyHZGbQ0DcdRbr+D+eVEnVmi2vh8lLOvPcQrzvGGa6piA==
X-Received: by 10.202.79.215 with SMTP id d206mr43937699oib.141.1474483961521; 
 Wed, 21 Sep 2016 11:52:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.218.85 with HTTP; Wed, 21 Sep 2016 11:52:41 -0700 (PDT)
In-Reply-To: <CACPK8Xe7LOX-kK5KbRNNdRC7RkbTZinsor-7pP9aubnUhanjjQ@mail.gmail.com>
References: <1472068452-32048-1-git-send-email-christopher.lee.bostic@gmail.com>
 <CACPK8XfTS+jyVGFRXZxPb4MQD3rzbFXmjQbqFn5c=aq+HopqkQ@mail.gmail.com>
 <CACPK8Xe7LOX-kK5KbRNNdRC7RkbTZinsor-7pP9aubnUhanjjQ@mail.gmail.com>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Wed, 21 Sep 2016 13:52:41 -0500
Message-ID: <CAA0LjjUG0+FaT448upMscVezRr_k0VjL296kr3WZhhCOCx8FGA@mail.gmail.com>
Subject: Re: [PATCH linux v5 0/7] Introducing the FSI device driver
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Chris Bostic <cbostic@us.ibm.com>, Jeremy Kerr <jk@ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Sep 2016 18:52:44 -0000

On Wed, Sep 7, 2016 at 7:10 PM, Joel Stanley <joel@jms.id.au> wrote:
> Hi Chris,
>
> On Fri, Sep 2, 2016 at 2:35 PM, Joel Stanley <joel@jms.id.au> wrote:
>> Hi Chris,
>>
>> On Thu, Aug 25, 2016 at 5:24 AM,  <christopher.lee.bostic@gmail.com> wrote:
>>> From: Chris Bostic <cbostic@us.ibm.com>
>>>
>>> Introduction of the IBM 'Flexible Support Interface' (FSI) bus device
>>> driver. FSI is a high fan out serial bus consisting of a clock and a serial
>>> data line capable of running at speeds up to 166 MHz.
>>
>
> I've taken a look at the patches. There doesn't seem to be much
> improvement over the last version.

In terms of patch ordering, starting with the generic bus registration
etc as per Jeremy's example I understand and will be reordering in
this way in the next set I submit.

>
>> I was wondering if you have had a look at Jeremy's implementation yet?
>> If so, are there any ideas you have incorporated into your series?
>
> I recommend you consider these questions and get back to me.
>
> Cheers,
>
> Joel
