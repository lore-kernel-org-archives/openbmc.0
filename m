Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41RNnY2vLfzDr0X
 for <openbmc@lists.ozlabs.org>; Fri, 13 Jul 2018 03:52:48 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 53A8697591
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 13:52:13 -0400 (EDT)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: [Maintainers] Call for maintenance
Message-Id: <1F65CF12-B31E-409C-BD72-D1CF3D0CFBFC@fuzziesquirrel.com>
Date: Thu, 12 Jul 2018 13:52:13 -0400
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3273)
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
X-List-Received-Date: Thu, 12 Jul 2018 17:52:50 -0000

I wanted to highlight a recent sdbusplus patch:

https://gerrit.openbmc-project.xyz/#/c/10566/

The nutshell is proper error handling of errors from libsystemd's
sd_bus_call has been added and sdbusplus::bus::call may now throw
SdBusError.

This note is an open call to all maintainers to scrub your applications
for use of sdbusplus::bus::call and handle SdBusError as appropriate.

I want to point out that catching SdBusError in your wrapper function
around sdbusplus::bus::call and simply eating it (or logging it, tracing
it, etc) is not really =E2=80=9Chandling=E2=80=9D this new exception.  =
Nor is wrapping
your entire program in a try block =E2=80=9Chandling=E2=80=9D it either. =
 Instead,
traverse the stack until you find the code with the logic that knows
whether or not the error is anticipated or not, and handle it there. =20

For example:

https://gerrit.openbmc-project.xyz/#/c/11423/3/src/propertywatchimpl.hpp

thx - brad=
