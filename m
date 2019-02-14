Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Toa+EGcN"; 
 dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 440qmL54XLzDqVf
 for <openbmc@lists.ozlabs.org>; Fri, 15 Feb 2019 08:49:22 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id f132so3757781pfa.6
 for <openbmc@lists.ozlabs.org>; Thu, 14 Feb 2019 13:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=PunHc8EGa43Xl+uhDME59SU7ovsk9VsOFNLQR6JSkAw=;
 b=Toa+EGcNSPaEWgumZyQ74+SJXUGpKbZ/drhcNMeNGtgHgkotyHMyi7/o0fqUagaE3V
 1+hkkomnExobZ5j5ywA/PRCjPkt2Sqy908vpgTKXUhR5A6alvBcvqYUQP2qbM4c0cbHl
 1iQKyidREREhqBpk9whZpA0nNe0G1UKqQARespRiBdGd5YY960kmQnKZlXvCB/amGS/C
 ldSDYDR4ATD3DybG5tyrBscmqG+/2foAEhJGpDHJ9achocm0wy43HWX9eog0n2bH6T7r
 nkfvWQfWz41ORFkj9XGQaI5UvtRm0VQvlTQxvaLZdcViJn/RYyKTVW65oMx8/lzNT22P
 GsdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=PunHc8EGa43Xl+uhDME59SU7ovsk9VsOFNLQR6JSkAw=;
 b=By+GWXKCb1oiNxx+7neYnX4kiAqCMGEBkToBmREAyyjJ7BNRq5+ixbmCzTqlrNZ2Vi
 7FXZGM86DAqZc5Honsy160m9QXRIZam06A+zFMsYgiApPzdAXqjVKH/z+7wGU24w6jWZ
 FXrJ210kH/SoJA8G4+Opm2L6GScKCPe8Q5sd/aG1cAoDyDotwG0SrTyw/GJODwNuYkzw
 Or7ieDeqPIlFTQff6EhQkSV3afe366nXsqcLqQPqOGYmRgzyALxso74s9gn5cXB8PDjK
 yeEzpsXpO4zXZU5N9VZyGZUb8jleKrhT/gILYbeL5e2D8GSXnoX7vkl+emkLrQXeRPla
 kGzw==
X-Gm-Message-State: AHQUAuau1em7hOwUA8q6mn2l9XqfT3JLQTM+1yn2VFGWM0MBOGd4PKDL
 eiVOq28CQFOPqrDvzoENemh2/UPRnuNtiut12ZcIq8eN3qQ=
X-Google-Smtp-Source: AHgI3IZYuWgGwF+IkqAhXj67otREj54phHM4I3jyZgEeFEHmeYvmuQH6Wn8IIA6draq7FNTkWfaxzFzVoIfhAzaR0OU=
X-Received: by 2002:a63:f74c:: with SMTP id f12mr2043216pgk.195.1550180959166; 
 Thu, 14 Feb 2019 13:49:19 -0800 (PST)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Thu, 14 Feb 2019 13:49:07 -0800
Message-ID: <CAO=notx8QjN1_2BbO5+nVnTCEE6=JNaWQzVi3tu73kVN+DKA1g@mail.gmail.com>
Subject: phosphor-pid-control yaml->cpp now json
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: James Feist <james.feist@linux.intel.com>
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
X-List-Received-Date: Thu, 14 Feb 2019 21:49:25 -0000

If you pick up the latest phosphor-pid-control patchset you may notice
it no longer uses build-time compilation.  There is a transition to
using run-time configurations, and phosphor-pid-control has taken
action from this.  Phosphor-pid-control can be configured with a json
file or via entity-manager with dbus.  It's my understanding that most
openbmc users are using entity-manager with phosphor-pid-control.
I'll be updating the downstream systems from yaml to json.  It's a
nearly identical configuration.  There is also an example available.

If you would like assistance moving your system from yaml native
recipe usage, let me know.  I'm more than willing to help you get
there!

Patrick
