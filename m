Return-Path: <raj.khem@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::243; helo=mail-qt0-x243.google.com;
 envelope-from=raj.khem@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EP4Eyfvk"; 
 dkim-atps=neutral
Received: from mail-qt0-x243.google.com (mail-qt0-x243.google.com
 [IPv6:2607:f8b0:400d:c0d::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40xs5S1bhvzDr4d
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jun 2018 14:38:03 +1000 (AEST)
Received: by mail-qt0-x243.google.com with SMTP id q6-v6so30684247qtn.3
 for <openbmc@lists.ozlabs.org>; Thu, 31 May 2018 21:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=rH8GtktabozjSF+s+VqobZO9kMa4u7y+7ntTW8i6ihE=;
 b=EP4Eyfvkw+W/SYLIWbs3h/E42ZYJtDHKjETFYRokw24oL6ioHYg/cnNcRqWHxnkukH
 XdzEW6YGwhkPs5ztpc+gGWmES+j7r3ag0ODXGqD4vGJn+KUP9iF41EzOTG8Wqw7Yy1uS
 cCSZeY/fX4hmuYegDkAx7Ud5wwzNTHrC7++UQzJlkgWUDgoNhP2CkpaV9U8S+WfAF0gr
 OSVzIWBq2gWA5oDBKDm6jEO68FOHPpln1xmOyGQ0WKUr0kmlGJMVvUtSQR9TRKEm5MZL
 EgHu/FWv56Q9YeM5wR2b3WEzrKExDjqb79Lt01AALYaMVIMX/3UJUPnmL5uWMs1kj1Kh
 3vnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=rH8GtktabozjSF+s+VqobZO9kMa4u7y+7ntTW8i6ihE=;
 b=HIUfXn4eWHgJZvqEXORjzPNPuVqIDcqfvX5sH26caXf+W7gvE21vNe66PFHprIKRwM
 gBTC1c3MZnDluBmy7KD1D3Enzl+UmFik1ILY0SZvmxCKlDmoOMrfra8DGnrkWR2CflH9
 BLrhBedpjfiMixfz1QmVHWrJQDhHvctD6v3Q48M4c9CFG1pg+dml0RbeMedpcvU7yuP+
 8p7S4DcLa47PY8tfOSMYF38DbuOuVSjgQhYPOLl0V6AN4JAbOhKILFTp22WlMYmc6c0H
 42o6oU/LLjGBCaKFd3fUqfE2mWW6yw7JEscsOlrnCgwu4p0xCEaeCXkBo1qtc3tDENn6
 mS7w==
X-Gm-Message-State: APt69E1W7Gqu8VCclhWdVHUbLaY5lGxrvJJi+kZrbQA/he6+jqCFPM+C
 EpIB5J7xK1yiY6KKecNRTfiKRTAn/n5+WF50MrM=
X-Google-Smtp-Source: ADUXVKIC/QmnPmlweXg3A6LZOvDBm21hr89tPI/Y68nh8OnOMkSaP4LtPuyXlh496rE+HPH9KY31e2ZYX5RlTKPnLo8=
X-Received: by 2002:ac8:4407:: with SMTP id
 j7-v6mr4025911qtn.117.1527827879200; 
 Thu, 31 May 2018 21:37:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:e486:0:0:0:0:0 with HTTP; Thu, 31 May 2018 21:37:28
 -0700 (PDT)
In-Reply-To: <1527820565.499695.1392530280.7147CEB3@webmail.messagingengine.com>
References: <20180510063718.16913-1-andrew@aj.id.au>
 <1527594494.687641.1388974752.4113AC8F@webmail.messagingengine.com>
 <CAMKF1spm=GQQq90gu58BdrNtqPQx_fxnA01ar9Jmr4PbQnmttQ@mail.gmail.com>
 <1527820565.499695.1392530280.7147CEB3@webmail.messagingengine.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 May 2018 21:37:28 -0700
Message-ID: <CAMKF1sr-k=TK-wyUtDJMUT8DK=EcS3A08jCJD-xjOD_Aw-MbQw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH v2 1/3] meta-python: Add python-pyflame
 recipe
To: Andrew Jeffery <andrew@aj.id.au>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
 openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 01 Jun 2018 15:54:00 +1000
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
X-List-Received-Date: Fri, 01 Jun 2018 04:38:05 -0000

On Thu, May 31, 2018 at 7:36 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Hi Khem,
>
> Thanks for testing.
>
> On Fri, 1 Jun 2018, at 02:18, Khem Raj wrote:
>> fails to build on qemumips
>>
>
> Do I have to support MIPS for the recipe to be acceptable? Is there some way we can limit the recipe to architectures for which the software is known to work?

Ideally we tend to support the core architectures and mips is one of
them, so unless there is a very basic
reason e.g. missing support etc. we tend to fix the problems, so I
would suggest to see if it can be fixed preferably
if not then we should cite the reason and probably we can add mips to
incompatible hosts but that is last resort
once a recipe goes in it becomes a maintenance work and I would like
to make it as light as possible.
