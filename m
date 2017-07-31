Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xLxF05SL7zDrVj
 for <openbmc@lists.ozlabs.org>; Tue,  1 Aug 2017 09:56:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CVlQaulD"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id t139so75114ywg.1
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 16:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=NX6uliCZkjwYffwaO/t+6RK4say78bUV2O0n14LzIOg=;
 b=CVlQaulDGu3bIt6TEHdXH87YJHEVk1tbVvuyPonSQ9C4xR+Rmuv96O1pYoExOaalay
 ezi+rmr0VvQwpFmEt8l+5WdLsrZ1AJMzhgnJRnzS+afl6BwcHjeFFPDAQU1RLFzL++aw
 v/uVoAMoTSmfihbtjwbtZ7iyoxFtG2B9RWqG+jLHfeh+YBL34HDd8key5wU229Pbb/a9
 wQ9tj1uhsIbcXeNVtdWc1cFpalUZKITpH4uNLb9KSL+a3TLnvKT9tAFtYlfNQzGFVtQf
 z0+ioktDfKWpQ2WU31qGFoP2eivpGAtRl0Q+oL7VmUd3Zxu3c4mRma5z6Iwm7alWPzk/
 RLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=NX6uliCZkjwYffwaO/t+6RK4say78bUV2O0n14LzIOg=;
 b=XpZHHgFlgwtYklwJGcfc+pbp31AvWJeL80cLnUzDMyVnAKUA4nNvBrlsowfb6jn4qW
 KBqc+niLjUgscPcMAGVDAO9PkYSpxrbP0GxP6zBovK1rYqc7orU8CvgCyNzRZBjrog1K
 Es6/5OInf3YbFam8k4jnLD+UNCRUupoq22Fie9/hD2nX2BQr2dxSpHdEUx3Wc4JI9+nW
 pKMingda7y/B/NUdbADXUi6wZv8G8CT5CqWF7UG5JjYUZSOqsrZ3qOhxf8lLYtedd3cr
 6dadRxpE/lBOa1PiutrGczUbp5EgS0QlPVsZmgk85Miv7txd8ILC5hBOmriaHIMF+VkT
 Ke6Q==
X-Gm-Message-State: AIVw112ma/dWF/D167nxrOvJTmTpJ8DkK0Hk6tetQULCUxAujpxCCxJf
 rKKltDA/14lpLD2kQVuxSru2H3smAQ==
X-Received: by 10.13.235.198 with SMTP id u189mr14567083ywe.360.1501545394205; 
 Mon, 31 Jul 2017 16:56:34 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.197.148 with HTTP; Mon, 31 Jul 2017 16:56:13 -0700 (PDT)
In-Reply-To: <CAFd5g44UjOfGwpCdCTQ7-0rPTXoWLvDcYAbekQ-JMtNsYHZneQ@mail.gmail.com>
References: <20170729010012.5032-1-brendanhiggins@google.com>
 <CACPK8XdT5yxKFj75JCuXZ+3GT1Q6x0EYADmFdu6we6SHwTMnLw@mail.gmail.com>
 <CAFd5g44UjOfGwpCdCTQ7-0rPTXoWLvDcYAbekQ-JMtNsYHZneQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 1 Aug 2017 09:26:13 +0930
X-Google-Sender-Auth: IbRHsTPN0KOwkSbGQXaLhq3h3Zg
Message-ID: <CACPK8Xdt3bOJkMWJqoOCyVkG2mdmsU+VtGhC1DDgLBYhDOd1PA@mail.gmail.com>
Subject: Re: [PATCH v1] i2c: aspeed: fixed potential null pointer dereference
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 31 Jul 2017 23:56:37 -0000

[dropping upstream cc]

On Tue, Aug 1, 2017 at 3:50 AM, Brendan Higgins
<brendanhiggins@google.com> wrote:
> On Mon, Jul 31, 2017 at 2:27 AM, Joel Stanley <joel@jms.id.au> wrote:
>> On Sat, Jul 29, 2017 at 10:30 AM, Brendan Higgins
>> <brendanhiggins@google.com> wrote:
>>> Before I skipped null checks when the master is in the STOP state; this
>>> fixes that.
>>>
>>> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
>>
>> Acked-by: Joel Stanley <joel@jms.id.au>
>>
>> Out of interest, was this found by code review, or did you hit this in testing?
>
> I am pretty sure we hit it in testing. Unfortunately, we had trouble reproducing
> it, but we did see a null pointer dereference.

Thanks. I've applied it to the openbmc dev-4.10 tree as well.

Cheers,

Joel
