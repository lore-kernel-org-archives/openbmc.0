Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="k7ZKAHgE"; 
 dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Fyvr1kt1zF0RF
 for <openbmc@lists.ozlabs.org>; Thu, 20 Sep 2018 10:55:51 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id 205-v6so2607171pgd.2
 for <openbmc@lists.ozlabs.org>; Wed, 19 Sep 2018 17:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=CiqNSbtCG+139mcYF7XTRE0c0hjt4FdwLwkHQcHm7Sg=;
 b=k7ZKAHgEFNeeZkHzRwWsQcNzkYnkbrXw2TzUcXYwcMSydaERwAGSAImj5lmaByQsoa
 wUZVXpB6WqwAtRQgx+xFmXGPoSbM8qKxwoSyk6W1odJKbvPyG966CaBgKqAadsNYJ6rS
 CXbCp6ANq17h98PNUozEYGDEkD1Ehajgfd2DL223MVifC5bZ30dkArzZdaDV7wfSt5T/
 gnb8OfVkO8b1UX49owbmrWNt2Fu15dOBufCQZAAs8DXhs47mICsdaiOG2ikzq0MfNlbJ
 ilX7RquQh0zu4hkrgP+bhPmvD5NFn1YKlvqVYPtStedbb0uyi0eEPWjYbpPF/6SItb6E
 GFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=CiqNSbtCG+139mcYF7XTRE0c0hjt4FdwLwkHQcHm7Sg=;
 b=LPY8fQYrAnIc2lvITKbENPaqiImvzfvZV71Ozlnr35eaHKP4sCM8gAXJ/C27WFzU38
 ecwzOG5fKx6IHTHzc/2l0V2ygZO8JISe3mGLWybiqXD+a7ZXRSb8hnVPxOlKSfsLfpDf
 ZMX0cIR8wm+L3YVflYy+3sbP/Ctpe3d2f75bhAA0xsLDqNdl6tm2UC4gesP/noHtPoFa
 aXcfj9hNgdIY7KtQSpnIDZeNTvwf6RarTHHsHjhLziwQFWy8tPRLXQhVzu475MvQ9roS
 KLrKITMfdfw0oBdm6UdoKPZgeAsnKIcox2dpzKAmtZeroDbWVGyZy2Y4Wmj11n4H8TRM
 cxvw==
X-Gm-Message-State: APzg51BSnTduDya6JPdg+bzR9YVm4RpzdzyZKLfL9TXoFMdmnIjLGtdR
 mk7b5OyU/guvzGTxjUCB7HnZ5VUclFlsi2la3ZdwaA==
X-Google-Smtp-Source: ANB0VdY3iPljqGj8f7B2sApk0Be7VdYDF7/kWDpmnVtDtFEnTObiRk0isMJZZPOZPRXsSgeJIcwhyqXvM95aGQt59Mg=
X-Received: by 2002:a63:4044:: with SMTP id
 n65-v6mr33507207pga.90.1537404949570; 
 Wed, 19 Sep 2018 17:55:49 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Wed, 19 Sep 2018 17:55:38 -0700
Message-ID: <CAO=notzGm3D-ug6OdeFiFTv8RFpoSWRVMusFBSrELe8RHRa2ag@mail.gmail.com>
Subject: subtree patches
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 20 Sep 2018 00:55:53 -0000

Brad;

Did you want us to generate the patches to openbmc/openbmc when we
update a subtree or do you have an automated process to pick up the
changes?

Patrick
