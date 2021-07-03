import 'package:fluttemis/domain/locus/feature.dart';
import 'package:fluttemis/domain/locus/locus.dart';
import 'package:fluttemis/utils/constants.dart';
import 'package:kt_dart/kt.dart';

KtList<Locus> getLocus() => KtList.of(
      Locus(
        name: 'SCU49845',
        length: 5028,
        type: 'DNA',
        organism: "Saccharomyces cerevisiae (baker's yeast)",
        releaseDate: '29-OCT-2018',
        shape: 'linear',
        sequence:
            'gatcctccatatacaacggtatctccacctcaggtttagatctcaacaacggaaccattgccgacatgagacagttaggtatcgtcgagagttacaagctaaaacgagcagtagtcagctctgcatctgaagccgctgaagttctactaagggtggataacatcatccgtgcaagaccaagaaccgccaatagacaacatatgtaacatatttaggatatacctcgaaaataataaaccgccacactgtcattattataattagaaacagaacgcaaaaattatccactatataattcaaagacgcgaaaaaaaaagaacaacgcgtcatagaacttttggcaattcgcgtcacaaataaattttggcaacttatgtttcctcttcgagcagtactcgagccctgtctcaagaatgtaataatacccatcgtaggtatggttaaagatagcatctccacaacctcaaagctccttgccgagagtcgccctcctttgtcgagtaattttcacttttcatatgagaacttattttcttattctttactctcacatcctgtagtgattgacactgcaacagccaccatcactagaagaacagaacaattacttaatagaaaaattatatcttcctcgaaacgatttcctgcttccaacatctacgtatatcaagaagcattcacttaccatgacacagcttcagatttcattattgctgacagctactatatcactactccatctagtagtggccacgccctatgaggcatatcctatcggaaaacaataccccccagtggcaagagtcaatgaatcgtttacatttcaaatttccaatgatacctataaatcgtctgtagacaagacagctcaaataacatacaattgcttcgacttaccgagctggctttcgtttgactctagttctagaacgttctcaggtgaaccttcttctgacttactatctgatgcgaacaccacgttgtatttcaatgtaatactcgagggtacggactctgccgacagcacgtctttgaacaatacataccaatttgttgttacaaaccgtccatccatctcgctatcgtcagatttcaatctattggcgttgttaaaaaactatggttatactaacggcaaaaacgctctgaaactagatcctaatgaagtcttcaacgtgacttttgaccgttcaatgttcactaacgaagaatccattgtgtcgtattacggacgttctcagttgtataatgcgccgttacccaattggctgttcttcgattctggcgagttgaagtttactgggacggcaccggtgataaactcggcgattgctccagaaacaagctacagttttgtcatcatcgctacagacattgaaggattttctgccgttgaggtagaattcgaattagtcatcggggctcaccagttaactacctctattcaaaatagtttgataatcaacgttactgacacaggtaacgtttcatatgacttacctctaaactatgtttatctcgatgacgatcctatttcttctgataaattgggttctataaacttattggatgctccagactgggtggcattagataatgctaccatttccgggtctgtcccagatgaattactcggtaagaactccaatcctgccaatttttctgtgtccatttatgatacttatggtgatgtgatttatttcaacttcgaagttgtctccacaacggatttgtttgccattagttctcttcccaatattaacgctacaaggggtgaatggttctcctactattttttgccttctcagtttacagactacgtgaatacaaacgtttcattagagtttactaattcaagccaagaccatgactgggtgaaattccaatcatctaatttaacattagctggagaagtgcccaagaatttcgacaagctttcattaggtttgaaagcgaaccaaggttcacaatctcaagagctatattttaacatcattggcatggattcaaagataactcactcaaaccacagtgcgaatgcaacgtccacaagaagttctcaccactccacctcaacaagttcttacacatcttctacttacactgcaaaaatttcttctacctccgctgctgctacttcttctgctccagcagcgctgccagcagccaataaaacttcatctcacaataaaaaagcagtagcaattgcgtgcggtgttgctatcccattaggcgttatcctagtagctctcatttgcttcctaatattctggagacgcagaagggaaaatccagacgatgaaaacttaccgcatgctattagtggacctgatttgaataatcctgcaaataaaccaaatcaagaaaacgctacacctttgaacaacccctttgatgatgatgcttcctcgtacgatgatacttcaatagcaagaagattggctgctttgaacactttgaaattggataaccactctgccactgaatctgatatttccagcgtggatgaaaagagagattctctatcaggtatgaatacatacaatgatcagttccaatcccaaagtaaagaagaattattagcaaaacccccagtacagcctccagagagcccgttctttgacccacagaataggtcttcttctgtgtatatggatagtgaaccagcagtaaataaatcctggcgatatactggcaacctgtcaccagtctctgatattgtcagagacagttacggatcacaaaaaactgttgatacagaaaaacttttcgatttagaagcaccagagaaggaaaaacgtacgtcaagggatgtcactatgtcttcactggacccttggaacagcaatattagcccttctcccgtaagaaaatcagtaacaccatcaccatataacgtaacgaagcatcgtaaccgccacttacaaaatattcaagactctcaaagcggtaaaaacggaatcactcccacaacaatgtcaacttcatcttctgacgattttgttccggttaaagatggtgaaaatttttgctgggtccatagcatggaaccagacagaagaccaagtaagaaaaggttagtagatttttcaaataagagtaatgtcaatgttggtcaagttaaggacattcacggacgcatcccagaaatgctgtgattatacgcaacgatattttgcttaattttattttcctgttttattttttattagtggtttacagataccctatattttatttagtttttatacttagagacatttaattttaattccattcttcaaatttcatttttgcacttaaaacaaagatccaaaaatgctctcgccctcttcatattgagaatacactccattcaaaattttgtcgtcaccgctgattaatttttcactaaactgatgaataatcaaaggccccacgtcagaaccgactaaagaagtgagttttattttaggaggttgaaaaccattattgtctggtaaattttcatcttcttgacatttaacccagtttgaatccctttcaatttctgctttttcctccaaactatcgaccctcctgtttctgtccaacttatgtcctagttccaattcgatcgcattaataactgcttcaaatgttattgtgtcatcgttgactttaggtaatttctccaaatgcataatcaaactatttaaggaagatcggaattcgtcgaacacttcagtttccgtaatgatctgatcgtctttatccacatgttgtaattcactaaaatctaaaacgtatttttcaatgcataaatcgttctttttattaataatgcagatggaaaatctgtaaacgtgcgttaatttagaaagaacatccagtataagttcttctatatagtcaattaaagcaggatgcctattaatgggaacgaactgcggcaagttgaatgactggtaagtagtgtagtcgaatgactgaggtgggtatacatttctataaaataaaatcaaattaatgtagcattttaagtataccctcagccacttctctacccatctattcataaagctgacgcaacgattactattttttttttcttcttggatctcagtcgtcgcaaaaacgtataccttctttttccgaccttttttttagctttctggaaaagtttatattagttaaacagggtctagtcttagtgtgaaagctagtggtttcgattgactgatattaagaaagtggaaattaaattagtagtgtagacgtatatgcatatgtatttctcgcctgtttatgtttctacgtacttttgatttatagcaaggggaaaagaaatacatactattttttggtaaaggtgaaagcataatgtaaaagctagaataaaatggacgaaataaagagaggcttagttcatcttttttccaaaaagcacccaatgataataactaaaatgaaaaggatttgccatctgtcagcaacatcagttgtgtgagcaataataaaatcatcacctccgttgcctttagcgcgtttgtcgtttgtatcttccgtaattttagtcttatcaatgggaatcataaattttccaatgaattagcaatttcgtccaattctttttgagcttcttcatatttgctttggaattcttcgcacttcttttcccattcatctctttcttcttccaaagcaacgatccttctacccatttgctcagagttcaaatcggcctctttcagtttatccattgcttccttcagtttggcttcactgtcttctagctgttgttctagatcctggtttttcttggtgtagttctcattattagatctcaagttattggagtcttcagccaattgctttgtatcagacaattgactctctaacttctccacttcactgtcgagttgctcgtttttagcggacaaagatttaatctcgttttctttttcagtgttagattgctctaattctttgagctgttctctcagctcctcatatttttcttgccatgactcagattctaattttaagctattcaatttctctttgatc',
        features: getLocusFeatures(),
        featuresTypesList: _getFeaturesList(),
        featuresTypesOverview: {
          'source': 1,
          'mRNA': 3,
          'CDS': 3,
          'gene': 2,
        },
        featuresTypesProductsOverview: {
          'Known': 3,
        },
      ),
    );

KtList<Feature> getLocusFeatures() => KtList.of(
      const Feature(
        id: '150280source',
        start: 1,
        end: 5028,
        type: 'source',
        strand: 0,
        color: colorLocusFeatureNotProduct,
        show: false,
        typeByOverlap: 'source',
      ),
      const Feature(
        id: '12060mRNA',
        start: 1,
        end: 206,
        type: 'mRNA',
        strand: 0,
        product: 'TCP1-beta',
        color: colorLocusFeatureKnownProduct,
        show: false,
        typeByOverlap: 'mRNA',
      ),
      const Feature(
        id: '12060CDS',
        start: 1,
        end: 206,
        type: 'CDS',
        strand: 0,
        product: 'TCP1-beta',
        aminoacids: 'SSIYNGISTSGLDLNNGTIADMRQLGIVESYKLKRAVVSSASEAAEVLLRVDNIIRARPRTANRQHM',
        color: colorLocusFeatureKnownProduct,
        show: true,
        typeByOverlap: 'CDS',
      ),
      const Feature(
        id: '68731580gene',
        start: 687,
        end: 3158,
        type: 'gene',
        strand: 0,
        name: 'AXL2',
        color: colorLocusFeatureNotProduct,
        show: false,
        typeByOverlap: 'gene',
      ),
      const Feature(
        id: '68731580mRNA',
        start: 687,
        end: 3158,
        type: 'mRNA',
        strand: 0,
        product: 'Axl2p',
        name: 'AXL2',
        color: colorLocusFeatureKnownProduct,
        show: false,
        typeByOverlap: 'mRNA',
      ),
      const Feature(
        id: '68731580CDS',
        start: 687,
        end: 3158,
        type: 'CDS',
        strand: 0,
        product: 'Axl2p',
        name: 'AXL2',
        note: 'plasma membrane glycoprotein',
        aminoacids:
            'MTQLQISLLLTATISLLHLVVATPYEAYPIGKQYPPVARVNESFTFQISNDTYKSSVDKTAQITYNCFDLPSWLSFDSSSRTFSGEPSSDLLSDANTTLYFNVILEGTDSADSTSLNNTYQFVVTNRPSISLSSDFNLLALLKNYGYTNGKNALKLDPNEVFNVTFDRSMFTNEESIVSYYGRSQLYNAPLPNWLFFDSGELKFTGTAPVINSAIAPETSYSFVIIATDIEGFSAVEVEFELVIGAHQLTTSIQNSLIINVTDTGNVSYDLPLNYVYLDDDPISSDKLGSINLLDAPDWVALDNATISGSVPDELLGKNSNPANFSVSIYDTYGDVIYFNFEVVSTTDLFAISSLPNINATRGEWFSYYFLPSQFTDYVNTNVSLEFTNSSQDHDWVKFQSSNLTLAGEVPKNFDKLSLGLKANQGSQSQELYFNIIGMDSKITHSNHSANATSTRSSHHSTSTSSYTSSTYTAKISSTSAAATSSAPAALPAANKTSSHNKKAVAIACGVAIPLGVILVALICFLIFWRRRRENPDDENLPHAISGPDLNNPANKPNQENATPLNNPFDDDASSYDDTSIARRLAALNTLKLDNHSATESDISSVDEKRDSLSGMNTYNDQFQSQSKEELLAKPPVQPPESPFFDPQNRSSSVYMDSEPAVNKSWRYTGNLSPVSDIVRDSYGSQKTVDTEKLFDLEAPEKEKRTSRDVTMSSLDPWNSNISPSPVRKSVTPSPYNVTKHRNRHLQNIQDSQSGKNGITPTTMSTSSSDDFVPVKDGENFCWVHSMEPDRRPSKKRLVDFSNKSNVNVGQVKDIHGRIPEML',
        color: colorLocusFeatureKnownProduct,
        show: true,
        typeByOverlap: 'CDS',
      ),
      const Feature(
        id: '330040371gene',
        start: 3300,
        end: 4037,
        type: 'gene',
        strand: 1,
        name: 'REV7',
        color: colorLocusFeatureNotProduct,
        show: false,
        typeByOverlap: 'gene',
      ),
      const Feature(
        id: '330040371mRNA',
        start: 3300,
        end: 4037,
        type: 'mRNA',
        strand: 1,
        product: 'Rev7p',
        name: 'REV7',
        color: colorLocusFeatureKnownProduct,
        show: false,
        typeByOverlap: 'mRNA',
      ),
      const Feature(
        id: '330040371CDS',
        start: 3300,
        end: 4037,
        type: 'CDS',
        strand: 1,
        product: 'Rev7p',
        name: 'REV7',
        aminoacids:
            'MNRWVEKWLRVYLKCYINLILFYRNVYPPQSFDYTTYQSFNLPQFVPINRHPALIDYIEELILDVLSKLTHVYRFSICIINKKNDLCIEKYVLDFSELQHVDKDDQIITETEVFDEFRSSLNSLIMHLEKLPKVNDDTITFEAVINAIELELGHKLDRNRRVDSLEEKAEIERDSNWVKCQEDENLPDNNGFQPPKIKLTSLVGSDVGPLIIHQFSEKLISGDDKILNGVYSQYEEGESIFGSLF',
        color: colorLocusFeatureKnownProduct,
        show: true,
        typeByOverlap: 'CDS',
      ),
    );

String getLocusSequenceFormatted() =>
    'gatcctccatatacaacggtatctccacctcaggtttagatctcaacaacggaaccattgccgacatgagacagttaggtatcgtcgagagttacaagctaaaacgagcagtagtcagctctgcatctgaagccgctgaagttctactaagggtggataacatcatccgtgcaagaccaagaaccgccaatagacaacatatgtaacatatttaggatatacctcgaaaataataaaccgccacactgtcattattataattagaaacagaacgcaaaaattatccactatataattcaaagacgcgaaaaaaaaagaacaacgcgtcatagaacttttggcaattcgcgtcacaaataaattttggcaacttatgtttcctcttcgagcagtactcgagccctgtctcaagaatgtaataatacccatcgtaggtatggttaaagatagcatctccacaacctcaaagctccttgccgagagtcgccctcctttgtcgagtaattttcacttttcatatgagaacttattttcttattctttactctcacatcctgtagtgattgacactgcaacagccaccatcactagaagaacagaacaattacttaatagaaaaattatatcttcctcgaaacgatttcctgcttccaacatctacgtatatcaagaagcattcacttaccatgacacagcttcagatttcattattgctgacagctactatatcactactccatctagtagtggccacgccctatgaggcatatcctatcggaaaacaataccccccagtggcaagagtcaatgaatcgtttacatttcaaatttccaatgatacctataaatcgtctgtagacaagacagctcaaataacatacaattgcttcgacttaccgagctggctttcgtttgactctagttctagaacgttctcaggtgaaccttcttctgacttactatctgatgcgaacaccacgttgtatttcaatgtaatactcgagggtacggactctgccgacagcacgtctttgaacaatacataccaatttgttgttacaaaccgtccatccatctcgctatcgtcagatttcaatctattggcgttgttaaaaaactatggttatactaacggcaaaaacgctctgaaactagatcctaatgaagtcttcaacgtgacttttgaccgttcaatgttcactaacgaagaatccattgtgtcgtattacggacgttctcagttgtataatgcgccgttacccaattggctgttcttcgattctggcgagttgaagtttactgggacggcaccggtgataaactcggcgattgctccagaaacaagctacagttttgtcatcatcgctacagacattgaaggattttctgccgttgaggtagaattcgaattagtcatcggggctcaccagttaactacctctattcaaaatagtttgataatcaacgttactgacacaggtaacgtttcatatgacttacctctaaactatgtttatctcgatgacgatcctatttcttctgataaattgggttctataaacttattggatgctccagactgggtggcattagataatgctaccatttccgggtctgtcccagatgaattactcggtaagaactccaatcctgccaatttttctgtgtccatttatgatacttatggtgatgtgatttatttcaacttcgaagttgtctccacaacggatttgtttgccattagttctcttcccaatattaacgctacaaggggtgaatggttctcctactattttttgccttctcagtttacagactacgtgaatacaaacgtttcattagagtttactaattcaagccaagaccatgactgggtgaaattccaatcatctaatttaacattagctggagaagtgcccaagaatttcgacaagctttcattaggtttgaaagcgaaccaaggttcacaatctcaagagctatattttaacatcattggcatggattcaaagataactcactcaaaccacagtgcgaatgcaacgtccacaagaagttctcaccactccacctcaacaagttcttacacatcttctacttacactgcaaaaatttcttctacctccgctgctgctacttcttctgctccagcagcgctgccagcagccaataaaacttcatctcacaataaaaaagcagtagcaattgcgtgcggtgttgctatcccattaggcgttatcctagtagctctcatttgcttcctaatattctggagacgcagaagggaaaatccagacgatgaaaacttaccgcatgctattagtggacctgatttgaataatcctgcaaataaaccaaatcaagaaaacgctacacctttgaacaacccctttgatgatgatgcttcctcgtacgatgatacttcaatagcaagaagattggctgctttgaacactttgaaattggataaccactctgccactgaatctgatatttccagcgtggatgaaaagagagattctctatcaggtatgaatacatacaatgatcagttccaatcccaaagtaaagaagaattattagcaaaacccccagtacagcctccagagagcccgttctttgacccacagaataggtcttcttctgtgtatatggatagtgaaccagcagtaaataaatcctggcgatatactggcaacctgtcaccagtctctgatattgtcagagacagttacggatcacaaaaaactgttgatacagaaaaacttttcgatttagaagcaccagagaaggaaaaacgtacgtcaagggatgtcactatgtcttcactggacccttggaacagcaatattagcccttctcccgtaagaaaatcagtaacaccatcaccatataacgtaacgaagcatcgtaaccgccacttacaaaatattcaagactctcaaagcggtaaaaacggaatcactcccacaacaatgtcaacttcatcttctgacgattttgttccggttaaagatggtgaaaatttttgctgggtccatagcatggaaccagacagaagaccaagtaagaaaaggttagtagatttttcaaataagagtaatgtcaatgttggtcaagttaaggacattcacggacgcatcccagaaatgctgtgattatacgcaacgatattttgcttaattttattttcctgttttattttttattagtggtttacagataccctatattttatttagtttttatacttagagacatttaattttaattccattcttcaaatttcatttttgcacttaaaacaaagatccaaaaatgctctcgccctcttcatattgagaatacactccattcaaaattttgtcgtcaccgctgattaatttttcactaaactgatgaataatcaaaggccccacgtcagaaccgactaaagaagtgagttttattttaggaggttgaaaaccattattgtctggtaaattttcatcttcttgacatttaacccagtttgaatccctttcaatttctgctttttcctccaaactatcgaccctcctgtttctgtccaacttatgtcctagttccaattcgatcgcattaataactgcttcaaatgttattgtgtcatcgttgactttaggtaatttctccaaatgcataatcaaactatttaaggaagatcggaattcgtcgaacacttcagtttccgtaatgatctgatcgtctttatccacatgttgtaattcactaaaatctaaaacgtatttttcaatgcataaatcgttctttttattaataatgcagatggaaaatctgtaaacgtgcgttaatttagaaagaacatccagtataagttcttctatatagtcaattaaagcaggatgcctattaatgggaacgaactgcggcaagttgaatgactggtaagtagtgtagtcgaatgactgaggtgggtatacatttctataaaataaaatcaaattaatgtagcattttaagtataccctcagccacttctctacccatctattcataaagctgacgcaacgattactattttttttttcttcttggatctcagtcgtcgcaaaaacgtataccttctttttccgaccttttttttagctttctggaaaagtttatattagttaaacagggtctagtcttagtgtgaaagctagtggtttcgattgactgatattaagaaagtggaaattaaattagtagtgtagacgtatatgcatatgtatttctcgcctgtttatgtttctacgtacttttgatttatagcaaggggaaaagaaatacatactattttttggtaaaggtgaaagcataatgtaaaagctagaataaaatggacgaaataaagagaggcttagttcatcttttttccaaaaagcacccaatgataataactaaaatgaaaaggatttgccatctgtcagcaacatcagttgtgtgagcaataataaaatcatcacctccgttgcctttagcgcgtttgtcgtttgtatcttccgtaattttagtcttatcaatgggaatcataaattttccaatgaattagcaatttcgtccaattctttttgagcttcttcatatttgctttggaattcttcgcacttcttttcccattcatctctttcttcttccaaagcaacgatccttctacccatttgctcagagttcaaatcggcctctttcagtttatccattgcttccttcagtttggcttcactgtcttctagctgttgttctagatcctggtttttcttggtgtagttctcattattagatctcaagttattggagtcttcagccaattgctttgtatcagacaattgactctctaacttctccacttcactgtcgagttgctcgtttttagcggacaaagatttaatctcgttttctttttcagtgttagattgctctaattctttgagctgttctctcagctcctcatatttttcttgccatgactcagattctaattttaagctattcaatttctctttgatc';

Map<String, List<Feature>> _getFeaturesList() => {
      'CDS': [
        const Feature(
          id: '12060CDS',
          start: 1,
          end: 206,
          type: 'CDS',
          strand: 0,
          product: 'TCP1-beta',
          aminoacids: 'SSIYNGISTSGLDLNNGTIADMRQLGIVESYKLKRAVVSSASEAAEVLLRVDNIIRARPRTANRQHM',
          color: colorLocusFeatureKnownProduct,
          show: true,
          typeByOverlap: 'CDS',
        ),
        const Feature(
          id: '68731580CDS',
          start: 687,
          end: 3158,
          type: 'CDS',
          strand: 0,
          product: 'Axl2p',
          name: 'AXL2',
          note: 'plasma membrane glycoprotein',
          aminoacids:
              'MTQLQISLLLTATISLLHLVVATPYEAYPIGKQYPPVARVNESFTFQISNDTYKSSVDKTAQITYNCFDLPSWLSFDSSSRTFSGEPSSDLLSDANTTLYFNVILEGTDSADSTSLNNTYQFVVTNRPSISLSSDFNLLALLKNYGYTNGKNALKLDPNEVFNVTFDRSMFTNEESIVSYYGRSQLYNAPLPNWLFFDSGELKFTGTAPVINSAIAPETSYSFVIIATDIEGFSAVEVEFELVIGAHQLTTSIQNSLIINVTDTGNVSYDLPLNYVYLDDDPISSDKLGSINLLDAPDWVALDNATISGSVPDELLGKNSNPANFSVSIYDTYGDVIYFNFEVVSTTDLFAISSLPNINATRGEWFSYYFLPSQFTDYVNTNVSLEFTNSSQDHDWVKFQSSNLTLAGEVPKNFDKLSLGLKANQGSQSQELYFNIIGMDSKITHSNHSANATSTRSSHHSTSTSSYTSSTYTAKISSTSAAATSSAPAALPAANKTSSHNKKAVAIACGVAIPLGVILVALICFLIFWRRRRENPDDENLPHAISGPDLNNPANKPNQENATPLNNPFDDDASSYDDTSIARRLAALNTLKLDNHSATESDISSVDEKRDSLSGMNTYNDQFQSQSKEELLAKPPVQPPESPFFDPQNRSSSVYMDSEPAVNKSWRYTGNLSPVSDIVRDSYGSQKTVDTEKLFDLEAPEKEKRTSRDVTMSSLDPWNSNISPSPVRKSVTPSPYNVTKHRNRHLQNIQDSQSGKNGITPTTMSTSSSDDFVPVKDGENFCWVHSMEPDRRPSKKRLVDFSNKSNVNVGQVKDIHGRIPEML',
          color: colorLocusFeatureKnownProduct,
          show: true,
          typeByOverlap: 'CDS',
        ),
        const Feature(
          id: '330040371CDS',
          start: 3300,
          end: 4037,
          type: 'CDS',
          strand: 1,
          product: 'Rev7p',
          name: 'REV7',
          aminoacids:
              'MNRWVEKWLRVYLKCYINLILFYRNVYPPQSFDYTTYQSFNLPQFVPINRHPALIDYIEELILDVLSKLTHVYRFSICIINKKNDLCIEKYVLDFSELQHVDKDDQIITETEVFDEFRSSLNSLIMHLEKLPKVNDDTITFEAVINAIELELGHKLDRNRRVDSLEEKAEIERDSNWVKCQEDENLPDNNGFQPPKIKLTSLVGSDVGPLIIHQFSEKLISGDDKILNGVYSQYEEGESIFGSLF',
          color: colorLocusFeatureKnownProduct,
          show: true,
          typeByOverlap: 'CDS',
        ),
      ],
    };
