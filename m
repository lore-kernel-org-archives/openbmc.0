Return-Path: <jaghu@google.com>
Received: from mail-pf0-x233.google.com (mail-pf0-x233.google.com
 [IPv6:2607:f8b0:400e:c00::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t4k0V4v1mzDvQC
 for <openbmc@lists.ozlabs.org>; Fri, 28 Oct 2016 10:40:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=chaHZ6KC; 
 dkim-atps=neutral
Received: by mail-pf0-x233.google.com with SMTP id e6so25770878pfk.3
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 16:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=hhaMUkv7wNkveLFj4+W43QnUkkb4ifXG7iTr/tai+1c=;
 b=chaHZ6KCRk4/M/mRW89nheaC13pbcCDw9vxMfEXOTJVLqJnNauWk1q0CWE6QLYtZim
 lWgaWlZXxbOuqh6iO7/Jweq65LkfbaLwchtrjXU2Q0oeoqcArKIIgVW/Af+1LUsPTbJi
 l5v2HBN4xSi3EvORfZcxDkH91T4hpuTwidia4Zv/UUjtcjx1NSAJxd2y6DmoniEl0bdW
 4Zb4MYWedZWtiREbDDUiL+GboUPONHZQX8yBkziLRc3qe9M0ke1IZ2imsSKYmJ533mJN
 T8+RopXhZNVWP+XrHzSMAFGMvkY4+DagNRAtsQnTQ4t3zQqzTvmsemMKW7mP/VIcOzh+
 12Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=hhaMUkv7wNkveLFj4+W43QnUkkb4ifXG7iTr/tai+1c=;
 b=ZefKDd2qOE1GhIbnf1YqUc+zomI1dX10qjafK7XF///z9J+a+LMU9bbcIwcM7Ks9W4
 kusUcEJRU6nDwWPGL/6VOdZxN6jqO0kylKUn+77BiiD6nvMAHfF0EIIdimsiWpj17jTT
 RBxbgJr3gtGxB1tzADMNfk7NC7Xxr7vNAwXjcwFdthqE0U+cy24BNLauZ2AiKoleLAqW
 +PtQ6U/hshInPyWZRi3uen2h1h6yeHs/IClUrOjYShE+iiD/exKlYJxcrDcVbxWLqFFW
 Zoq6+67xRuLECcnCdgceihzNBF3RLNWOPz3H//ZeQfVMXWi1YRc4p39aQmmiYgesf7FD
 J/Eg==
X-Gm-Message-State: ABUngveB1SVcgH3o2lG5klxRhfTtlfCa3LtiuhDx3NCjmljQX2sZx5ABG0ZmhipaE6nwaqsh
X-Received: by 10.99.167.75 with SMTP id w11mr15943126pgo.16.1477611640563;
 Thu, 27 Oct 2016 16:40:40 -0700 (PDT)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id y189sm14147467pfy.34.2016.10.27.16.40.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 27 Oct 2016 16:40:39 -0700 (PDT)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
Subject: Aspeed PWM driver support 
Date: Thu, 27 Oct 2016 16:40:19 -0700
Message-Id: <1477611622-28120-1-git-send-email-jaghu@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
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
X-List-Received-Date: Thu, 27 Oct 2016 23:40:44 -0000
X-List-Received-Date: Thu, 27 Oct 2016 23:40:44 -0000

Included :
Aspeed PWM controller driver 
Aspeed PWM device driver

Todo:
Aspeed FAn tacho driver
