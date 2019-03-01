Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="K8d22cRK"; 
 dkim-atps=neutral
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 449x0F4Gd3zDqTF
 for <openbmc@lists.ozlabs.org>; Sat,  2 Mar 2019 04:16:13 +1100 (AEDT)
Received: by mail-ot1-x32f.google.com with SMTP id 98so21649539oty.1
 for <openbmc@lists.ozlabs.org>; Fri, 01 Mar 2019 09:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=CfzxbC/IOkITBhZOauMvzqIZdKa0uVIaxWdsH3gFlFk=;
 b=K8d22cRKsM+Lj+Bt5ahhcbnMjtWyOzNz/PPd6OKnvMkEIFO1WaKABSWSx0FwquVUvP
 RMTl41aDwH5ZQszqpmS+muXO0D/ewAPm8DAAIv7PpozGCmAI3P15Bwx18bb3eADQVn3p
 hASGEEZ/H95AqD+DTPKoQbFrVZUkGYJ1u4A+/ywsQcQfRJpZKvnSX8Ru3dkWqFPmJoIT
 nRGLhsqkqQKxktwtgat60Oh8LSNwfPrBHxqKkBufilsf1ZLTIM5loWMw/7WeybdnqcS3
 uJ0GkWOre55M8Da40UXEJfTd2I5tLIgF9C6qRpesgHevWlGHdIWqNNioS8ZRx1ZNKJ7M
 fPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=CfzxbC/IOkITBhZOauMvzqIZdKa0uVIaxWdsH3gFlFk=;
 b=WL2anb92sPnf6iA8kqXU7Q39Xhw69PMRxR1I7+x1G37xKwq36BmgxYd3ZuUG6MbgXS
 lPor+osohAk225j5MCpBtMD2/unYg1VY5qpMuygfq1xjjt8q7n66EUF8o/ie3oQrrk/T
 8/TdrMdaBM7Q5NjXiLY8LkPcIIMvdZVuTNC5or0r5ceuL2rjh3pMJaN4KoDc7yK+iDY/
 4dBzSK3+JmAIIlAjKvq7LWwNXos03MMHxPOxcDtvJqOjYCt+sCdFplkwp9GRK3xKcMDJ
 89gvsIpuUISMfwQZBnmWv/k9y6UprIn3iU712w6xlRpqJBbaS9Y3WajW65I1yL6J1GxK
 aU4Q==
X-Gm-Message-State: APjAAAUPXyWvjZB4FmvaOHqS5RBSaQgC2NE1LPimGplDo9eQRUJYUjA6
 DYME8UcnlXDrRWKuEjAyLt/fBMlj
X-Google-Smtp-Source: APXvYqyJU/hjCdjOqhV5LeajxF5OMB2RNDiVskrzSDEEpBks+xTPLWHg8ms34AisfNAT+L+yxyH/uQ==
X-Received: by 2002:a05:6830:14d6:: with SMTP id
 t22mr4202207otq.255.1551460570316; 
 Fri, 01 Mar 2019 09:16:10 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id e24sm9123919otl.2.2019.03.01.09.16.09
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 01 Mar 2019 09:16:09 -0800 (PST)
From: krtaylor <kurt.r.taylor@gmail.com>
Subject: 2.7 Release Planning Guidelines - Features, Designs and Milestones
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <0f698442-7f23-4d4f-9e00-f5b77703e543@gmail.com>
Date: Fri, 1 Mar 2019 11:16:08 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.5.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Fri, 01 Mar 2019 17:16:14 -0000

All,

At the last release planning meeting we agreed to start enforcing the 
design requirement for 2.7 release features. This gives the repo 
maintainer the authority to not merge major contributions without 
designs in place. Of course, the maintainer also has the discretion to 
"grandfather" in work that was previously underway that had designs 
socialized in IRC or email. I think having these designs in place will 
fix a lot of the release notes concerns, as well as level-setting what 
we're all working on.

TLDR: if work has a feature issue created in github (tagged Release2.7), 
it MUST to have a design template filled out in order to be merged.

Second, we agreed to set a VERY aggressive schedule for having all 
feature issue designs in place: *March 25th*  Obviously, that means that 
release feature issues need to be completed before then.

Third, we also agreed to establish checkpoints for delivery of features 
so we can check the feature progress, seek community assistance, etc. We 
will establish Design, Code1, Code2, Freeze and Release milestones. They 
are mostly self-explanatory, with Code1 and Code2 being used for staging 
dependent work for instance. They will be approximately 6 week intervals.

Finally, I am asking for EVERYONE'S help in making sure what you are 
working on falls into a openbmc/openbmc issue tagged Release2.7 (or 
Release2.8 for long-running projects). If not, and it is not a quick fix 
or small enhancement, please let your release planning rep know and help 
them get the feature issue created ASAP. Check here: 
https://github.com/openbmc/openbmc/issues?q=is%3Aopen+is%3Aissue+label%3ARelease2.7

As always, I am available for any questions. Find me on IRC or come to a 
release planning meeting and let's discuss.

Kurt Taylor (krtaylor)
