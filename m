Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::22d; helo=mail-ua0-x22d.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="b8NlbrMY"; 
 dkim-atps=neutral
Received: from mail-ua0-x22d.google.com (mail-ua0-x22d.google.com
 [IPv6:2607:f8b0:400c:c08::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41KBpn3z61zF1LR
 for <openbmc@lists.ozlabs.org>; Tue,  3 Jul 2018 02:02:24 +1000 (AEST)
Received: by mail-ua0-x22d.google.com with SMTP id r10-v6so10384451uao.1
 for <openbmc@lists.ozlabs.org>; Mon, 02 Jul 2018 09:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=QP0i40MWclGF6cL5y1GK0ILcKRqKKKoxfbeOUsEep90=;
 b=b8NlbrMYlVbyMFgVz4/ssckqyNv28pL0qY0zXvbD3xMgf6yh8uZWkEeKn0hWpAvZf5
 /FRngd+BM3bV9sDa09xIy6hJUMJsRZ+Hqb1vqBSbWYzpm+QbxZ/CxsUWyXtSv8UvzCUy
 ukOfXZm7FLQLPtvjRr6v206siJFc3XwBCyfELGdSkP5MjI2A+vJtsxmhmrepFYekIq8w
 roUAS2Qn6N09ow1/ExO/ThzUL9pEmj/p3iFJ8nO+laOZHKQIufnq79EHfNqrbuiQ8qPm
 o6DfxnIzB/tUe4s5SY+c7ffJ//3rYAtJARHZCeHTObB2bJeEg+QNYUiz5JBidlpWZ84i
 tJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=QP0i40MWclGF6cL5y1GK0ILcKRqKKKoxfbeOUsEep90=;
 b=QDqWTVOnKGzgkA3AcBhZ7cqA0g2m2WM6xAigmpdEsztFbaz8i7YgX7KZ7oodOpMc92
 uU7Dbjt2Cko7D7KC4PTXoxcAvOklXtWW9MmKCln+3ltORpuixds39/T0zwPweX1t44Br
 FOfB44StNCtvS3Bba9BhxLudo1PTrKthLmymvsqX5hRBUIHSRxN8Jdkhgf3rvOqzQDad
 6JOwg1M1aHRL5unCueGJJuaHhukYWg0HV7kZfbQYHk5q6gElMHiBrxmtnfVZssfEwKHh
 Zb9LoICbav+HjF16DoFn/DpgnRxE4UZE75wPfUdoUReYjH8PjLYufJpiMaha5ir9lRew
 z4cw==
X-Gm-Message-State: APt69E3JrIlDze89OJ0Tqnv9No6LqphxfIk2NtAKtR56lD4xlqk4SZq0
 CLDO2hSucYA+O4lywN6OB5/y/T1bmC8nKx/y4PSTTnvz
X-Google-Smtp-Source: AAOMgpffFstaM6f8khzVHur1Ill3XoyRJkU0WvAh7BnMIRfkHw0TK8J08oRJNiF8UN2jFsmR8JXbLLV7QLkv249olNo=
X-Received: by 2002:ab0:1c1a:: with SMTP id
 a26-v6mr16161376uaj.142.1530547341640; 
 Mon, 02 Jul 2018 09:02:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1f:9b90:0:0:0:0:0 with HTTP;
 Mon, 2 Jul 2018 09:02:01 -0700 (PDT)
From: Patrick Venture <venture@google.com>
Date: Mon, 2 Jul 2018 09:02:01 -0700
Message-ID: <CAO=notyR8OMD83cyKvKSnLeJ+-fSRPiPAV6zc7_wMvREKvViaw@mail.gmail.com>
Subject: phosphor-hwmon etc
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Jul 2018 16:02:27 -0000

i'm OOO for the rest of the week and will do my best to ignore work.

Patrick
