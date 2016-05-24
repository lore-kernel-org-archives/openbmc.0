Return-Path: <joel.stan@gmail.com>
Received: from mail-qg0-x242.google.com (mail-qg0-x242.google.com
 [IPv6:2607:f8b0:400d:c04::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rDJcy5d9MzDqNQ
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2016 12:04:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=ZW+MfHj4; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=B/3ho2Xv; 
 dkim-atps=neutral
Received: by mail-qg0-x242.google.com with SMTP id t106so282834qgt.2
 for <openbmc@lists.ozlabs.org>; Mon, 23 May 2016 19:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:from:date:message-id:subject:to:cc;
 bh=nX1vJiRB1Gi79Tq1fiU3eWGQUxHgriQzuKqhPyZ/9Tg=;
 b=ZW+MfHj4E83re0ZDLtmWlYRIVUniNbnjBI8Vs9st622Hl6Rw0eRVfFZJoPI1X5Ko0a
 svswoQOw9RMCfkLyaQhFyZqCwr9sGpvKZmbsudQlxAA0cFqwHNzXdBcY+yPkPhEIcCF+
 MhEaDf8/dOULPZj2HcysCzTVeUbJj2AS7pId3jB4gYj3Kq4zS18kN4BKbJC0giC+GvUU
 qWEa3Ox2sNO6eXtLZd64jchUex2JuSLH3ClWbi1N9qviKVvBYaLXP79+PMYJu05xjVY5
 mv29mDPF+9ZMqgz2LP7xk2K3fnI2FdAMfiIWszl0J98OdILMx4mudFwiMK0y+Oswj+xF
 pXvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:from:date:message-id:subject:to:cc;
 bh=nX1vJiRB1Gi79Tq1fiU3eWGQUxHgriQzuKqhPyZ/9Tg=;
 b=B/3ho2Xvf49jG33DHn8riYT3DMz1nQ7GL8u0g9KJo+AeiZL0lGuLQ+p3giNLmYHQeX
 1S1F2sHQZs2hlH7kddVgz793Cc7QLgNqB2TYz+EwCCZ7ZpZkcSQHm5g2q+NrKHd+BL01
 QRtj/dpjh5T87jKO8v9a/lMGKfdjpOabdTOzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
 :to:cc;
 bh=nX1vJiRB1Gi79Tq1fiU3eWGQUxHgriQzuKqhPyZ/9Tg=;
 b=Yj3A5ADCACisfDU0VlO3/rIEPzrSpPK0VkFeh8g2TAH0IFl6QtDDTZQyG3peQOlMEn
 +3gFpK+WgUgDtkL7sZq70diwl/ohNB6/9HzoI7ivEhKJquLnlIuIY8EJ9P5teoMj3auE
 KL/B4X9AUFH/XYw2cKMzrKLYSFd91fel4ENB1oScHEc10FbU849oZ+n3LcGTfxJnL9kR
 I3NHNA4TI+sGWz/ata6zwGqRfcceIyLtTfmZVaWahkH+2XAM5yZPN6JDoh6INv5LCTia
 0P6u4eKz2IHl/5x7F0W5ZISuRQ1BScMuINrt5vYZ/RegWUYgHifBdGSqEwduC5n0f5SB
 Z4bQ==
X-Gm-Message-State: ALyK8tJfbymRXYI+eZ+9aYC1uzFC7iryYBlyfLsOvNJiIlRnYm2yAETuGrk/CbEV2gAH1j0Q8uatZsXhOKOHFA==
X-Received: by 10.140.37.21 with SMTP id q21mr1067487qgq.69.1464055472001;
 Mon, 23 May 2016 19:04:32 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.51.135 with HTTP; Mon, 23 May 2016 19:04:12 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 24 May 2016 11:34:12 +0930
X-Google-Sender-Auth: 1INvYlwdlossd0dxBHBCKn5nmDM
Message-ID: <CACPK8XeD2BPqnJSCBdAnjUforTujhq+qYOCdtXnroO0=Q=2UUw@mail.gmail.com>
Subject: Re:_[PATCH_linux]_Add_debounce_for_power_button,
 _pull_down_gpioQ7_to_unlock_identify_LED
To: ken.th.liu@foxconn.com
Cc: anoo@us.ibm.com, OpenBMC Patches <openbmc-patches@stwcx.xyz>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, sam.wc.su@foxconn.com,
 arvin.yh.yen@foxconn.com, 
 ken.sk.lai@foxconn.com, andrew.cl.lin@foxconn.com, john.hc.wang@foxconn.com
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Tue, 24 May 2016 02:04:37 -0000

Hello Ken,

On Tue, May 17, 2016 at 7:25 PM, <ken.th.liu@foxconn.com> wrote:
> So you mean for the debounce setting.
>
> I have to make a new pull request on /openbmc/linux with detail commit in github?

I saw you made a new pull request for the Linux side of your patch.
This is good progress.

You also left some comments on github. Can you please add those
comments to the patch?

Cheers,

Joel
