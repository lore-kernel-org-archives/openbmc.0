Return-Path: <ratagupt@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ratagupt@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44dyWZ26NrzDqGN
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 05:48:09 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x39Jdbm2028208
 for <openbmc@lists.ozlabs.org>; Tue, 9 Apr 2019 15:48:06 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2rs1bk96d4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 09 Apr 2019 15:48:04 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Tue, 9 Apr 2019 20:48:02 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 9 Apr 2019 20:48:00 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x39JlxQo51904748
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Apr 2019 19:48:00 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CEA0FAE059;
 Tue,  9 Apr 2019 19:47:59 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 84B6AAE051;
 Tue,  9 Apr 2019 19:47:58 +0000 (GMT)
Received: from [9.85.231.252] (unknown [9.85.231.252])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue,  9 Apr 2019 19:47:58 +0000 (GMT)
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
To: "Tanous, Ed" <ed.tanous@intel.com>, bradleyb@fuzziesquirrel.com,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Sending the FD over D-bus
Date: Wed, 10 Apr 2019 01:17:55 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------ACA0BFCB82FB7A9A999409A2"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19040919-0028-0000-0000-0000035F0AB7
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19040919-0029-0000-0000-0000241E2A51
Message-Id: <d27b3022-cf65-80e3-fcea-8e7e9027acaa@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-09_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904090124
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
X-List-Received-Date: Tue, 09 Apr 2019 19:48:11 -0000

This is a multi-part message in MIME format.
--------------ACA0BFCB82FB7A9A999409A2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi All,

As Discussed in yesterday community call, I did some POC to send the 
unix FD object over the D-Bus.

BackGround: We are exploring the possibilities how to send the secrets 
from one process to other process,

a) If the IPC is D-bus

b) Calling process doesn't have the root permission to write the secrets 
in the configuration file.

One of the proposal came, Can the calling process  send the unix fd over 
the D-Bus instead of sending the actual password

and receiving process reads the data from the sent fd.?

There was a confusion if some other app can snoop the D-bus message and 
get the FD and read it.I tried to simulate the same

behavior in the POC but not sure whether it is correct or not.

This POC has two files which is attached with this mail.

Dbus-Service(dbus-service-fd-test.py):  Method(readFD) which takes the 
unix fd as parameter reads it and send the data back

Dbus-Client(dbus-client-fd-test.py): Writes dummy data in the file, then 
opens the file and send the fd over D-bus.


After sending the data over D-bus , I introduced a sleep of 15 sec so 
that I can try to open the same fd from other

process,I open the python shell and try to open the shared FD but 
couldn't open it.

Ratan













--------------ACA0BFCB82FB7A9A999409A2
Content-Type: text/x-python;
 name="dbus-client-fd-test.py"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="dbus-client-fd-test.py"

import unittest
import time

import dbus
import dbus.service
import dbus.glib

class TestCase(unittest.TestCase):

    def setUp(self):
        # WRITE SOMETHING IN THE FILE AND
        # close it
        f = open("/tmp/fd-test", "w")
        f.write("Hello, World!")
        f.close();


    def testHelloService(self):
        bus = dbus.SessionBus()
        service = bus.get_object('test.readFDservice', '/test/readFDservice')
        method = service.get_dbus_method('readFD', 'test.readFDservice')
        # Have written the hello world in the fd-test file, open the file and
        # send the fd over D-bus.
        f = open('/tmp/fd-test')
        print ("fd = %d" % f.fileno())
        fds = {0:dbus.types.UnixFd(f)}
        r = method("Test", fds)
        time.sleep(60) #To invoke another prg to try to read the shared fd.
        f.close()

        print ("r = %s" % r)
        assert r == "Hello, World!" # we got the same string


if __name__ == '__main__':
    unittest.main()

--------------ACA0BFCB82FB7A9A999409A2
Content-Type: text/x-python;
 name="dbus-service-fd-test.py"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="dbus-service-fd-test.py"

import os

import dbus
import dbus.service
import dbus.glib
import gobject

class ReadFDService(dbus.service.Object):

    def __init__(self):
        bus_name = dbus.service.BusName('test.readFDservice', bus = dbus.SessionBus())
        dbus.service.Object.__init__(self, bus_name, '/test/readFDservice')

    def listen(self):
        loop = gobject.MainLoop()
        loop.run()

    @dbus.service.method('test.readFDservice', in_signature="sa{uh}")
    def readFD(self, serviceName, fds):
        print ([type(param) for param in (serviceName, fds)]  )
        print ("serviceName: %s" % serviceName)
        print ("fd: %s" % fds)
        r = os.fdopen(fds[0].take()).read()
        return r


if __name__ == '__main__':

    myservice = ReadFDService()
    myservice.listen()

--------------ACA0BFCB82FB7A9A999409A2--
