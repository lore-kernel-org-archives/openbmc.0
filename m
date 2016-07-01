Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgnXc0RDMzDqmK
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 17:07:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=ewY6t/SJ; 
 dkim-atps=neutral
Received: by mail-qk0-x243.google.com with SMTP id r68so18954128qka.3
 for <openbmc@lists.ozlabs.org>; Fri, 01 Jul 2016 00:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=clskTXjyggyKaPKXMtnlHqPB4oLtV9i59srYPZJ/ogY=;
 b=ewY6t/SJzPCOja4UYIb1rU8wcbyb7Xi1IviYcLQvs8dFzoC5bFeQppcjcbtIFHmzHE
 uMd1tQpBzeO+ETxzKcrKe7RLP5ohSceeZwQZzLrJWzLyVkq46+pP+gN6KVzlKa+eyyov
 4Nt12q7y3FGIHnX9Fru3IzUB6Yype002JIqYwShi5roweXXYQ/n7ObVs+Zbv+zaHLUSk
 Ve8ykwTWS6I7QUoiS09tJ4+Bu7jCRf0AfkyJuZzvwY8Z3rfdC5pXuXh9VcRog+Zvljgb
 S6YyFl+gw5DCxbqQu2dmjc8E8b3k38MPipLkF5qbX2ORwttyvnaRET5K0LTUoK6gXUcM
 X7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=clskTXjyggyKaPKXMtnlHqPB4oLtV9i59srYPZJ/ogY=;
 b=WhTvOObvnHR05bUOjZwA6YqlkiWGEewwv+By6oF9gjhOE5fnfwE3Lq8xMA4OgPmzmA
 zmnQ6+DV7+RLxlhJCN4TscXfvH357H9wnJkDlkHuTWJBQPfcaYToQAZisg9ah1Jg1XAB
 XclbL7neS8AKXuDRer+nkdrp3edzUEh6gUMV9mNfVeTlGxNuOnG4bc68Wwdzc+aDgW58
 rrWG2H7ePh/mHbMoF5hMqVybGaebWnznVvFmUiCZ9b+0wjTEQhCqkZ0nOVyB+ktVhtaM
 /+M2+YH5kkOisqefgvxsWImFTbzq5CqZ4KB+Er0d+npq0fDSeHQKKenIBXDCDncXC8bs
 +ocw==
X-Gm-Message-State: ALyK8tKp6VyZmLeBXBg3ZCb14Z2d5lEBoRTM0s2jW4ZuUmZq/rrBPt5Ue+SJoWnuHLxSX8esBPD3CUom3MwPkQ==
X-Received: by 10.55.149.3 with SMTP id x3mr25582779qkd.140.1467356830166;
 Fri, 01 Jul 2016 00:07:10 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Fri, 1 Jul 2016 00:06:50 -0700 (PDT)
In-Reply-To: <421eeaeb-3d6b-03a4-55d7-7abf0df625fe@kaod.org>
References: <1467216591-8616-1-git-send-email-clg@kaod.org>
 <1467216591-8616-10-git-send-email-clg@kaod.org>
 <1467268194.6386.29.camel@jms.id.au>
 <fb9428a4-877f-fe0c-0ad8-6d84e23f88c4@kaod.org>
 <b09c6fea-db1e-e5ab-5ecd-fbc8b0a1f0b1@kaod.org>
 <421eeaeb-3d6b-03a4-55d7-7abf0df625fe@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 1 Jul 2016 16:36:50 +0930
X-Google-Sender-Auth: oJ4bgCEtdxm5RasdcrAqOlI_nIk
Message-ID: <CACPK8Xc5FK5+DBn=+va3iAeDtEgq26uFNXtBFU0g=QMNJKuujg@mail.gmail.com>
Subject: Re: [PATCH uboot v2016.05-aspeed-openbmc 9/9] ast-g4/g5: large cleanup
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Fri, 01 Jul 2016 07:07:13 -0000

On Fri, Jul 1, 2016 at 2:08 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 06/30/2016 10:34 AM, C=C3=A9dric Le Goater wrote:
>> Here is the v2 with code removal (scu) :
>>
>>       https://github.com/legoater/u-boot/commits/v2016.05-aspeed-openbmc
>
> I dropped the "aspeed/ast-g4: add a force saveenv config" patch in that
> tree. It did not bring much.

Thanks! I merged the series with my signed off added. HEAD is now at

 https://github.com/openbmc/u-boot/commit/60e2744bd3959f8ed705bcce5df26cbb0=
266bba4

And the CI system built it automatically for us:

 https://openpower.xyz/job/openbmc-u-boot/

Cheeers,

Joel
