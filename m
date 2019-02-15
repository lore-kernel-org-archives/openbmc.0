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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4410XD5RVtzDqVB
 for <openbmc@lists.ozlabs.org>; Fri, 15 Feb 2019 15:24:28 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1F4Iki9112655
 for <openbmc@lists.ozlabs.org>; Thu, 14 Feb 2019 23:24:26 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2qnmdrcsqm-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 14 Feb 2019 23:24:25 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Fri, 15 Feb 2019 04:24:23 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 15 Feb 2019 04:24:21 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x1F4OKMH56295530
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Fri, 15 Feb 2019 04:24:20 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C74B52052
 for <openbmc@lists.ozlabs.org>; Fri, 15 Feb 2019 04:24:20 +0000 (GMT)
Received: from [9.85.132.76] (unknown [9.85.132.76])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 144A85204E
 for <openbmc@lists.ozlabs.org>; Fri, 15 Feb 2019 04:24:18 +0000 (GMT)
Subject: Re: Redfish: Generating and installing CSR based certificates.
To: openbmc@lists.ozlabs.org
References: <CACkAXSpTdZ8s_Qd2j1qkwBy7Ti+7ieOzyJtcLkCEqBmsLWs4AQ@mail.gmail.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Date: Fri, 15 Feb 2019 09:54:16 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CACkAXSpTdZ8s_Qd2j1qkwBy7Ti+7ieOzyJtcLkCEqBmsLWs4AQ@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------8D60D8C00471AFE1F9D6A980"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19021504-4275-0000-0000-0000030FB920
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19021504-4276-0000-0000-0000381DD6D7
Message-Id: <827200f4-1c4f-9619-1037-26473a9b81e1@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-15_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902150030
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
X-List-Received-Date: Fri, 15 Feb 2019 04:24:29 -0000

This is a multi-part message in MIME format.
--------------8D60D8C00471AFE1F9D6A980
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jayanth,

I have some querys

On 14/02/19 7:23 PM, Jayanth Othayoth wrote:
> All,
> Please find the Redflish based CSR ( Certificate Signing Request) 
> generation and installing the certificate in BMC.
> This is based on the latest Redfish spec (Reference: 
> https://www.dmtf.org/sites/default/files/Redfish_2018_Release_3_Overview.pdf) 
> and related documents.
> Included the Gerrit link related to  d-bus interfaces :
>     Review Link: 
> https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+/16571/
>
> Looking for the inputs  on this  design flow and any additional 
> changes required from the security aspect on managing private keys in 
> the BMC.
>
>   * The user performs the GenerateCSR action ( URIs:
>     /redfish/v1/CertificateService ) with required parameters.
>       o Certificate service provides a d-bus interface to generate CSR .
>           + Certificate manager create Private key and saves the
>             service specific path
>           + Returns the d-bus path for the newly created CSR.
>
I am hoping this design is wrt Redfish, which explains the flow to 
deploy CSR based certificate.

I was little confused about d-bus interface terminology here, I 
understand that in redfish we have certificate service schema which has 
action

GenerateCSR, I am assuming we are talking about the same.

GenerateCSR should not return the d-bus Path however it should return 
the URI of the Certificate Collection where the certificate will be 
installed.

Does the GenerateCSR creates CSR resource which can be modifiable in future?

>       o  Certificate service provides d-bus interface to download CSR
>           +  The user need need wait for the creation of CSR specific
>             d-bus path to download the newly created CSR
>
Does the certificate service schema have the action Download CSR?

I hope that response of GenerateCSR returns the CSR, There should not be 
another redfish call to get the CSR.

>       o  The user takes the CSR file and get it signed by the
>         appropriate authority.
>           +  This step is outside the scope of Redfish.
>   *  The user navigates to the appropriate certificate collection
>       o   Example: if trying to replace the HTTPS certificate for a
>         Manager, navigate to the Manager’s Certificate Collection that
>         is subordinate to the NetworkProtocol/HTTPS object
>   * The user performs a POST on the Certificate Collection with the
>     certificate string in the body
>       o  Use the existing certificate upload d-bus interface.
>   * Certificate manager validates the certificate with the available
>     service specific private keys in the BMC.
>   * After successful validation  pairs the private key used in the
>     first step with the installed certificate.
>
Would the implementation persist the CSR and associated private key for 
verification?

I can understand that we can do the verification of public/private key 
through oprenssl function, but is there a possibility that user can 
change the CSR request(eg change the organization)

and get it signed and upload the certificate, How the implementation 
takes care of it?

Now suppose user creates three CSR request and on the BMC we have three 
associated private keys and once user upload the certificate

would the implementation starts matching the certificate public key with 
all the stored private keys and once it gets matched

then the implementation creates the pairing?

How the certificates would be deleted?
> Assumption:
>
>   * For a service, BMC allows maximum 3 ( ?) CSR requests. Any new
>     request after this will remove the oldest private key information
>     from the BMC.
>   * User has to do a Factory removing  the private key from the system.
>
Regards

Ratan Gupta


--------------8D60D8C00471AFE1F9D6A980
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi Jayanth,</p>
    <p>I have some querys<br>
    </p>
    <div class="moz-cite-prefix">On 14/02/19 7:23 PM, Jayanth Othayoth
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CACkAXSpTdZ8s_Qd2j1qkwBy7Ti+7ieOzyJtcLkCEqBmsLWs4AQ@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">
          <div dir="ltr">
            <div>All,</div>
            <div>Please find the Redflish based CSR ( Certificate
              Signing Request) generation and installing the certificate
              in BMC. <br>
            </div>
            <div>This is based on the latest Redfish spec (Reference: <a
href="https://www.dmtf.org/sites/default/files/Redfish_2018_Release_3_Overview.pdf"
                moz-do-not-send="true">https://www.dmtf.org/sites/default/files/Redfish_2018_Release_3_Overview.pdf</a>)
              and related documents. <br>
            </div>
            <div>Included the Gerrit link related to  d-bus interfaces :
              <br>
            </div>
            <div>    Review Link: <a
href="https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+/16571/"
                moz-do-not-send="true">https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+/16571/</a></div>
            <div><br>
            </div>
            <div>Looking for the inputs  on this  design flow and any
              additional changes required from the security aspect on
              managing private keys in the BMC. <br>
            </div>
            <div>
              <ul>
                <li>The user performs the GenerateCSR action ( URIs:
                  /redfish/v1/CertificateService ) with required
                  parameters.</li>
                <ul>
                  <li>Certificate service provides a d-bus interface to
                    generate CSR .</li>
                  <ul>
                    <li>Certificate manager create Private key and saves
                      the service specific path <br>
                    </li>
                    <li>Returns the d-bus path for the newly created
                      CSR.</li>
                  </ul>
                </ul>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <p><tt>I am hoping this design is wrt Redfish, which explains the
        flow to deploy CSR based certificate.</tt></p>
    <p><tt>I was little confused about d-bus interface terminology here,
        I understand that in redfish we have certificate service schema
        which has action</tt></p>
    <p><tt>GenerateCSR, I am assuming we are talking about the same.</tt><br>
    </p>
    <p><tt>GenerateCSR should not return the d-bus Path however it
        should return the </tt><tt><span><span class="objectBox
            objectBox-string"> URI of the Certificate Collection where
            the certificate will be installed.</span></span></tt></p>
    <p><tt>Does the GenerateCSR creates CSR resource which can be
        modifiable in future?<br>
      </tt></p>
    <blockquote type="cite"
cite="mid:CACkAXSpTdZ8s_Qd2j1qkwBy7Ti+7ieOzyJtcLkCEqBmsLWs4AQ@mail.gmail.com">
      <div dir="ltr">
        <div dir="ltr">
          <div dir="ltr">
            <div>
              <ul>
                <ul>
                  <li> Certificate service provides d-bus interface to
                    download CSR</li>
                  <ul>
                    <li> The user need need wait for the creation of CSR
                      specific d-bus path to download the newly created
                      CSR</li>
                  </ul>
                </ul>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <p><tt>Does the certificate service schema have the action Download
        CSR?</tt></p>
    <p><tt>I hope that response of GenerateCSR returns the CSR, There
        should not be another redfish call to get the CSR</tt>.<br>
    </p>
    <blockquote type="cite"
cite="mid:CACkAXSpTdZ8s_Qd2j1qkwBy7Ti+7ieOzyJtcLkCEqBmsLWs4AQ@mail.gmail.com">
      <div dir="ltr">
        <div dir="ltr">
          <div dir="ltr">
            <div>
              <ul>
                <ul>
                  <li> The user takes the CSR file and get it signed by
                    the appropriate authority.</li>
                  <ul>
                    <li> This step is outside the scope of Redfish.</li>
                  </ul>
                </ul>
                <li> The user navigates to the appropriate certificate
                  collection</li>
                <ul>
                  <li>  Example: if trying to replace the HTTPS
                    certificate for a Manager, navigate to the Manager’s
                    Certificate Collection that is subordinate to the  
                    NetworkProtocol/HTTPS object</li>
                </ul>
                <li>The user performs a POST on the Certificate
                  Collection with the certificate string in the body</li>
                <ul>
                  <li> Use the existing certificate upload d-bus
                    interface.</li>
                </ul>
                <li>Certificate manager validates the certificate with
                  the available service specific private keys in the
                  BMC.</li>
                <li>After successful validation  pairs the private key
                  used in the first step with the installed certificate.</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <p><tt>Would the implementation persist the CSR and associated
        private key for verification?</tt></p>
    <p><tt>I can understand that we can do the verification of
        public/private key through oprenssl function, but is there a
        possibility that user can change the CSR request(eg change the
        organization)</tt></p>
    <p><tt>and get it signed and upload the certificate, How the
        implementation takes care of it?</tt></p>
    <p><tt>Now suppose user creates three CSR request and on the BMC we
        have three associated private keys and once user upload the
        certificate</tt></p>
    <p><tt>would the implementation starts matching the certificate
        public key with all the stored private keys and once it gets
        matched</tt></p>
    <p><tt>then the implementation creates the pairing?</tt><br>
    </p>
    <tt>How the certificates would be deleted?</tt><br>
    <blockquote type="cite"
cite="mid:CACkAXSpTdZ8s_Qd2j1qkwBy7Ti+7ieOzyJtcLkCEqBmsLWs4AQ@mail.gmail.com">
      <div dir="ltr">
        <div dir="ltr">
          <div dir="ltr">
            <div>Assumption:<br>
            </div>
            <ul>
              <li>For a service, BMC allows maximum 3 ( ?) CSR requests.
                Any new request after this will remove the oldest
                private key information from the BMC.</li>
              <li>User has to do a Factory removing  the private key
                from the system.</li>
            </ul>
          </div>
        </div>
      </div>
    </blockquote>
    <p><tt>Regards</tt></p>
    <p><tt>Ratan Gupta</tt><br>
    </p>
  </body>
</html>

--------------8D60D8C00471AFE1F9D6A980--
