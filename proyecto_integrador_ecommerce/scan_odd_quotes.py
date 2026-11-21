with open(r'C:\Users\halo1\.gemini\antigravity\scratch\proyecto_integrador_ecommerce\01_FBD_Base_de_Datos\03_DML_Datos_Semilla\00_MASTER_SEED_DATA_SQLSERVER.sql', 'r', encoding='utf-8') as f:
    for idx, line in enumerate(f, 1):
        if line.startswith('('):
            if line.count("'") % 2 != 0:
                print(f"Line {idx} has ODD quotes: {line.strip()[:150]}")
