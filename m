Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x236.google.com (mail-oi0-x236.google.com
 [IPv6:2607:f8b0:4003:c06::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r53pb6pKMzDqBs
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2016 17:02:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=REqWlE/A; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=bHJj7ftI; 
 dkim-atps=neutral
Received: by mail-oi0-x236.google.com with SMTP id v145so105589584oie.0
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2016 00:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=N9Z4uArmG+TfBuj8N1ruaeYVqTj/qXJnBBF1qAtyEGU=;
 b=REqWlE/ANIT1aeaa8HwK/WurpobBllnGQeHs6pvPAb50tO7kiS0wGrVOcnjgFwJ5QZ
 gfmNIxXo5NZj02zNtrm+4KGe+Rcfaauu6KHhTJVKquHGcDB8eZayrH2+qSOKaFirL2hd
 SmPMi5aDkVDw3Oiey0Ib/0LnlOLKp8TmEEbiDzDXzLBClwaFj/eCJh2gmhg87MkOu8dx
 /iNoQa8nlJvxxl9UX2LqqH91tyLu6+FZUYztDrC/1yN5CEDEvRcdoRJQzqDoDIjQG7eS
 /D1ceeL8gBIbKbWpJrkfzcwc6CvYkqamtPqQBsGcgIEyr3AAehrwCr98c3gujI+e7uaw
 yCkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=N9Z4uArmG+TfBuj8N1ruaeYVqTj/qXJnBBF1qAtyEGU=;
 b=bHJj7ftI6L4N6wOU+Pwjzz3AhgK2Klr6fpcH9/6A+lq3roXfO/3Xma9NGHgVtSKMGs
 YLBz2CdgXZ4G+mfYwHwdzw/SChfTlKhjane9PsgqqtwlllSbMFyZsByOAkNqiahImmwA
 Tg7LNQ7Udxt4CXC+vQbA+BudInwSn4SG58i0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=N9Z4uArmG+TfBuj8N1ruaeYVqTj/qXJnBBF1qAtyEGU=;
 b=bzzqnJh8JKHyRAzXwUDPYlNp7ewjE5wFa+8ezUyExiqIbAEJkF/WuGulZGIUkjlTb7
 2LjMlJC4g046MeXTOYQyY1uAWzWHk+bhOQP6ih4eL4pOtdJB3HjOdo7OfOiOqZBF/vwS
 0j3hnMovkrrvTaHuerd+1F78iL+vCFjLXbg66YCwsllFQ75v6i77h4wnCr3C2YzJm6OR
 6gY+HKGeD4nGpwAxUPf1b/gibBAE87MlHuKW6uFxp6TaUuIA7cfKQwI3hf5bHuEDOiXy
 kV0En3/hZ8yNTydZtSKRd79mivyvlf1TWSZr9h2MIyebgpp23tWuoQ/tTGbGc/pMagkS
 +Vwg==
X-Gm-Message-State: AOPr4FUFaZBqC47S1yg/eieGQOhUdFHGYiHIO8ImnX08qMRTbfK/cCIRQoqYEaGTwOoK97Zb/5U2Ms+i+wGo0g==
X-Received: by 10.202.71.134 with SMTP id u128mr4601121oia.189.1463036565903; 
 Thu, 12 May 2016 00:02:45 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.3.102 with HTTP; Thu, 12 May 2016 00:02:26 -0700 (PDT)
In-Reply-To: <20160512063445.GA8400@gwshan>
References: <1462758439-27910-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <CACPK8Xf3-THRo2bj-+kd8-oU-qqwt=TR=KSV_sdoDj1t7ZPb_A@mail.gmail.com>
 <20160512063445.GA8400@gwshan>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 12 May 2016 16:32:26 +0930
X-Google-Sender-Auth: tsKvK9EXHqHT3_y6YsjM68Nj9vQ
Message-ID: <CACPK8XeTVbarxS5+ujEKt2yVvP5kjeChOPXaRH6sysQBr5y+-A@mail.gmail.com>
Subject: Re: [PATCH 0/8] NSCI Improvement
To: Gavin Shan <gwshan@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 12 May 2016 07:02:48 -0000

On Thu, May 12, 2016 at 4:04 PM, Gavin Shan <gwshan@linux.vnet.ibm.com> wrote:
> Thanks, Joel. Note that I had no chance to test it out on barreleye where
> the issue was reported. I cannot find a barreleye BMC in local lab. could
> you please tell if I can access any one of this kind of machine in case
> you know one?

Currently the only ones we have access to are in a lab at IBM in
Austin. I'll send you the details.

I think we should have another go at sending the patches upstream. Can
you create a series against 4.6? I'm looking in to finding us some
reviewers; I'll let you know when I hear something.

Cheers,

Joel
